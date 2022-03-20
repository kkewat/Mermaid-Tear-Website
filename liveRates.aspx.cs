using System;
using System.Net;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class liveRates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string url = "http://www.quandl.com/api/v1/datasets/BUNDESBANK/BBK01_WT5511.xml??utf8=%E2%9C%93&trim_start={0}&trim_end={1}&collapse=daily&transformation=&commit=Refine";
            DateTime today = DateTime.Now;
            url = string.Format(url, today.AddDays(-1).ToString("yyyy-MM-dd"), today.AddDays(-1).ToString("yyyy-MM-dd"));
            using (System.Net.WebClient client = new System.Net.WebClient())
            {
                string xml = client.DownloadString(url);
                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                doc.LoadXml(xml);
                string rate = doc.SelectNodes("/dataset/data/datum/datum")[1].InnerText;
            }
        }
    }
}