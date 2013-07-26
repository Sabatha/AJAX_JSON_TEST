<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Test.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>    
</head>
<body>
    <form id="form1" runat="server">
    <div>      
        <br />
        <br />
        2. Use jQuery's ajax capabilities to retrieve vehicles from GetVehicles.aspx when the Get Vehicles button is pressed<br />
        3. Populate the select list with the vehicles, using the id as the value, and the registration for display<br />
        4. On clicking an item in the list, display the vehicle id in the span<br />

        <br />
        <br />
        <select multiple="multiple" id="lstVehicles" onclick="PopulateVehicle(this.value)">
        </select>        
        <br />
        <br />
        <span id="txtVehicleID"></span>
        <br />
        <br />

        <input id="btnGetVehicles" type="button" value="Get Vehicles" onclick="show()" />

        <br /><br/><span id="fname"></span><br />

        <script type="text/javascript">

        function PopulateVehicle(registration)
        {
            document.getElementById("txtVehicleID").innerHTML = 'Vehicle ID is: ' + registration;
        }
        function AddOptions()
        {            
            // .each loops through the array
            $.each(dataArr, function (i) {
                $('#lstVehicles').append($("<option></option>")
                    .attr("value", dataArr[i]['value'])
                    .text(dataArr[i]['text']));
            });
        }
        function createXMLHttpRequest(){
              // Seehttp://en.wikipedia.org/wiki/XMLHttpRequest
              // Provide the XMLHttpRequest class for IE 5.x-6.x:
              if( typeof XMLHttpRequest == "undefined" ) XMLHttpRequest = function() {
                try { return new ActiveXObject("Msxml2.XMLHTTP.6.0") } catch(e) {}
                try { return new ActiveXObject("Msxml2.XMLHTTP.3.0") } catch(e) {}
                try { return new ActiveXObject("Msxml2.XMLHTTP") } catch(e) {}
                try { return new ActiveXObject("Microsoft.XMLHTTP") } catch(e) {}
                throw new Error( "This browser does not support XMLHttpRequest." )
              }
              return new XMLHttpRequest();
            }

            var AJAX = createXMLHttpRequest();

            function handler() {
              if(AJAX.readyState == 4 && AJAX.status == 200) {
                  var json = eval('(' + AJAX.responseText + ')');
                  
                  for (var i = 0; i < json.vehicles.length; i++)
                   {
                      // .each loops through the array
                      $('#lstVehicles').append($("<option></option>").attr("value", json.vehicles[i]['id']).text(json.vehicles[i]['registration']));
                   }
              }else if (AJAX.readyState == 4 && AJAX.status != 200) {
                  document.getElementById("txtVehicleID").innerHTML = 'Something is wrong...'
              }
            }

            function show(){
              AJAX.onreadystatechange = handler;
              AJAX.open("GET", "GetVehicles.aspx", true);
              AJAX.send("");
            }            
        </script>
    </div>
    </form>
</body>
</html>
