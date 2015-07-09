<%--

HTTP proxy utility intended for removing unexpected BOM (Byte Of Order Mark)
sequence in a response.

Usage: /BOMFixer.ashx?url=address

--%>

<%@ WebHandler Language="C#" Class="BOMFixer" %>
<%@ Assembly Name="System.Net.Http, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>

using System;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Linq;

class BOMFixerImpl
{
    private byte[] _contents;
    private string _url;

    public string SourceContentType { get; private set; }
    public readonly byte[] BOM = new byte[]{0xef, 0xbb, 0xbf};
    public const byte SPACE = 0x20;

    public BOMFixerImpl(string url)
    {
        _url = url;
    }

    public string GetContentAsString()
    {
        return Encoding.UTF8.GetString(_contents);
    }

    public bool LoadContent()
    {
        try
        {
            using (var httpClient = new HttpClient())
            {
                var response = httpClient.GetAsync(_url).Result;
                SourceContentType = response.Content.Headers.GetValues("Content-Type").FirstOrDefault();
                _contents = response.Content.ReadAsByteArrayAsync().Result;
                bool BOMfound = false;
                for (int i = 0; i < _contents.Length - 3; ++i)
                {
                    BOMfound = (_contents[i] == BOM[0]) && (_contents[i + 1] == BOM[1]) && (_contents[i + 2] == BOM[2]);
                    if (BOMfound)
                    {
                        _contents[i] = _contents[i + 1] = _contents[i + 2] = SPACE;
                    }
                }
            }
        }
        catch
        {
            return false;
        }
        return true;
    }
}

public class BOMFixer : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        var url = context.Request.QueryString["url"];
        var fixer = new BOMFixerImpl(url);
        if (fixer.LoadContent())
        {
            context.Response.ContentType = fixer.SourceContentType;
            context.Response.Write(fixer.GetContentAsString());
        }
        else
        {
            context.Response.ContentType = "text";
            context.Response.Write("Error");
        }
    }
    public bool IsReusable
    {
        get
        {
            return true;
        }
    }
}