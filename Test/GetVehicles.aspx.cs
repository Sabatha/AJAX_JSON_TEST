using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test

{
    public partial class GetVehicles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Clear();

            Response.ContentType = "application/json";

            string json = @"

                    {
                        ""vehicles"": [

                            { ""id"": 1, ""registration"": ""ND1234"" },
                            { ""id"": 2, ""registration"": ""ND5678"" },
                            { ""id"": 3, ""registration"": ""ND9123"" },
                            { ""id"": 4, ""registration"": ""ND1936"" },
                            { ""id"": 5, ""registration"": ""ND9724"" },
                            { ""id"": 6, ""registration"": ""ND3875"" },
                            { ""id"": 7, ""registration"": ""ND9913"" }

                        ]
                    }

                ";

            Response.Write(json);
            Response.End();

        }
    }
}