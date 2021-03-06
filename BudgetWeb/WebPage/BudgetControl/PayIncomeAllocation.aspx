﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PayIncomeAllocation.aspx.cs" Inherits="WebPage_BudgetControl_PayIncomeAllocation" %>

<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style> 
         .addico {
             background-image: none;
             padding: 0;
             margin: 0;
             width: 0;
         } 
        .x-grid-row td { 
            border-bottom: 1px solid #EDEDED !important;
            border-right: 1px solid #EDEDED !important;
        }
        .x-tree-elbow-empty {
            display: none !important;
        }
        /*#ext-gen1095{ display: none !important;}
        #ext-gen1105{ display: none !important;}
        #ext-gen1118{ display: none !important;}*/
    </style>
    <script src="../../js/jquery-1.7.2.min.js"></script>
    <script>
        function GetTotal() { 
            var p1 = new Array();
            var p2 = new Array();
            var p3 = new Array();
            var p4 = new Array();
            var trlist = "";
            var treebody = "#TPPayIncome-body div table tbody tr";
            var tr1;
            var tr2;
            var tr3;
            var tr4;
            if ($(treebody).length > 0) {
                $(treebody).each(function () {
                    if (!$(this).hasClass("x-grid-tree-node-leaf")) {
                        if ($(this).prop("innerText").indexOf("工资福利支出") > -1) {
                            tr1 = $(this);
                        }
                        if ($(this).prop("innerText").indexOf("商品和服务支出") > -1) {
                            tr2 = $(this);
                        }
                        if ($(this).prop("innerText").indexOf("对个人和家庭补助支出") > -1) {
                            tr3 = $(this);
                        }
                        if ($(this).prop("innerText").indexOf("其他资本性支出")>-1) {
                            tr4 = $(this);
                        }
                    }
                });
            }
            trlist = trlist.substring(0, trlist.Length - 1);
            //var tr1 = $("#"+trlist.split("*")[1]);//$(treebody).eq(1);
            //var tr2 = $("#"+trlist.split("*")[2]);//$(treebody).eq(2);
            //var tr3 = $("#"+trlist.split("*")[3]);//$(treebody).eq(3);
            //var tr4 = $("#"+trlist.split("*")[4]);//$(treebody).eq(4);
            if ($("#HidtotalMon").val()!="") {
                p1 = $("#HidtotalMon").val().split("*");
            } else {
                p1 = ["0", "0"];
            }
            if ($("#HidtotalMon1").val() != "") {
                p2 = $("#HidtotalMon1").val().split("*");
            } else {
                p2 = ["0", "0"];
            }
            if ($("#HidtotalMon2").val() != "") {
                p3 = $("#HidtotalMon2").val().split("*");
            } else {
                p3 = ["0", "0"];
            }
            if ($("#HidtotalMon3").val() != "") {
                p4 = $("#HidtotalMon3").val().split("*");
            } else {
                p4 = ["0", "0"];
            } 
            if ($("#HidtotalMon").val() != "" || tr1.find(" .x-grid-cell-Column5 div").html().replace("&nbsp;", "").length > 1 || tr1.find("  .x-grid-cell-last div").html().replace("&nbsp;", "").length > 1) {
                if ($("#HidtotalMon").val() == "") {

                }
                else {
                    tr1.find(".x-grid-cell-Column5 div").html(p1[0]); tr1.find(".x-grid-cell-last div").html(p1[1]);
                }
            }
            else { tr1.find(".x-grid-cell-Column5 div").html("0"); tr1.find(".x-grid-cell-last div").html("0"); }
           
            if ($("#HidtotalMon1").val() != "" || tr2.find(".x-grid-cell-Column5 div").html().replace("&nbsp;", "").length > 1 || tr2.find(".x-grid-cell-last div").html().replace("&nbsp;", "").length > 1) {
                if ($("#HidtotalMon1").val() == "") {

                }
                else {
                    tr2.find(".x-grid-cell-Column5 div").html(p2[0]); tr2.find(".x-grid-cell-lastdiv").html(p2[1]);
                }
            }
            else { tr2.find(".x-grid-cell-Column5 div").html("0"); tr2.find(".x-grid-cell-last div").html("0"); }
          
            if ($("#HidtotalMon2").val() != "" || tr3.find(".x-grid-cell-Column5 div").html().replace("&nbsp;", "").length > 1 || tr3.find(".x-grid-cell-last div").html().replace("&nbsp;", "").length > 1) {
                if ($("#HidtotalMon2").val() == "") {

                }
                else {
                    tr3.find(".x-grid-cell-Column5 div").html(p3[0]); tr3.find(".x-grid-cell-last div").html(p3[1]);
                }
            }
            else { tr3.find(".x-grid-cell-Column5 div").html("0"); tr3.find(".x-grid-cell-last div").html("0"); }
          
            if ($("#HidtotalMon3").val() != "" || tr4.find(".x-grid-cell-Column5 div").html().replace("&nbsp;", "").length > 1 || tr4.find(".x-grid-cell-last div").html().replace("&nbsp;", "").length > 1) {
                if ($("#HidtotalMon3").val() == "") {

                }
                else {
                    tr4.find(".x-grid-cell-Column5 div").html(p4[0]); tr4.find(".x-grid-cell-last div").html(p4[1]);
                }
            }
            else { tr4.find(".x-grid-cell-Column5 div").html("0"); tr4.find(".x-grid-cell-last div").html("0"); }
//            $("#ext-gen1134  .x-grid-cell-Column5 div").html(p1[0]); $("#ext-gen1134  .x-grid-cell-Column6 div").html(p1[1]);
//            $("#ext-gen1135  .x-grid-cell-Column5 div").html(p2[0]); $("#ext-gen1135  .x-grid-cell-Column6 div").html(p2[1]);
//            $("#ext-gen1136  .x-grid-cell-Column5 div").html(p3[0]); $("#ext-gen1136  .x-grid-cell-Column6 div").html(p3[1]);
//            $("#ext-gen1137  .x-grid-cell-Column5 div").html(p4[0]); $("#ext-gen1137  .x-grid-cell-Column6 div").html(p4[1]);
        }
      

        var GetSelect = function () {
            var select = "";
            selChildren = App.TPPayIncome.getChecked();

            Ext.each(selChildren, function (node) {
                if (select.length > 0) {
                    select += ", ";
                }

                select += node.data.text;
            });
            $("#Hidselector").val(select);
        }
        var nodeLoad = function (store, operation, options) {
            var node = operation.node;
            App.direct.NodeLoad(node.getId(), {
                success: function (result) {
                    node.set('loading', false);
                    node.set('loaded', true);
                    var data = Ext.decode(result);
                    node.appendChild(data, undefined, true);
                    node.expand();
                },

                failure: function (errorMsg) {
                    Ext.Msg.alert('错误', '请重新打开页面');
                }
            }); 
            return false;
        };


    </script>
</head>
<body>
    <form id="form1" runat="server">
       <%-- <asp:HiddenField  runat="server"   ID="HidSlist"/>--%>
        <ext:ResourceManager ID="ResourceManager1" runat="server" />
        
        <ext:Viewport runat="server" ID="vwpLayout" Layout="FitLayout">
            
            <Items> 
                 <ext:Hidden runat="server" ID="HidSlist"/>
                 <ext:Hidden ID="HidtotalMon" runat="Server"></ext:Hidden>
                 <ext:Hidden ID="HidtotalMon1" runat="Server"></ext:Hidden>
                 <ext:Hidden ID="HidtotalMon2" runat="Server"></ext:Hidden>
                 <ext:Hidden ID="HidtotalMon3" runat="Server"></ext:Hidden>
                <ext:Hidden ID="HidLeaf" runat="Server"></ext:Hidden>
                <ext:Hidden ID="HidDepid" runat="server"></ext:Hidden>
                <ext:Hidden ID="HidSupp" runat="server"></ext:Hidden>
                <ext:Hidden ID="HidBAA" runat="server"></ext:Hidden>
                <%--<ext:Hidden ID="HidPIID" runat="server"></ext:Hidden>--%>
                <ext:Hidden ID="Hidselector" runat="server"></ext:Hidden>
                <ext:FormPanel ID="plallocation" runat="server"
                    Title="预算分配" Layout="FitLayout">
                    <Items>
                        <ext:TreePanel
                            ID="TPPayIncome"
                            Lines="false"
                            UseArrows="true"
                            runat="server"
                            AutoScroll="true"
                            Animate="true"
                            Mode="Remote"
                            RootVisible="false"
                            ContainerScroll="true"
                            OnRemoteEdit="RemoteEdit">

                            <%--<Store>
                                <ext:TreeStore ID="TStore" runat="server" OnReadData="GetNodes" ModelName="text">
                                </ext:TreeStore>
                            </Store>--%>
                            <Fields>
                                <ext:ModelField Name="text" />
                                <ext:ModelField Name="BAAMon" />
                                <ext:ModelField Name="SuppMon" />
                            </Fields> 
                            <ColumnModel>
                                <Columns>
                                    <ext:TreeColumn ID="TreeColumn1" runat="server" DataIndex="text" Text="经济科目" Flex="4">
                                    </ext:TreeColumn>
                                    <ext:Column ID="Column5" runat="server" DataIndex="BAAMon" Text="分配金额" Flex="1">
                                        <Editor>
                                            <ext:NumberField runat="server" />
                                        </Editor>
                                    </ext:Column>
                                    <ext:Column ID="Column6" runat="server" DataIndex="SuppMon" Text="追加余额" Flex="1">
                                        <Editor>
                                            <ext:NumberField runat="server" />
                                        </Editor>
                                    </ext:Column>
                                </Columns>
                            </ColumnModel>
                            <Plugins>
                                <ext:CellEditing ID="CellEditing1" runat="server">
                                    <Listeners><Edit  Handler="GetTotal();"></Edit></Listeners>
                                </ext:CellEditing>
                                <%--<ext:RowEditing runat="server" />--%>
                            </Plugins>
                            <Listeners> 
                                <BeforeLoad Fn="nodeLoad" /> 
                                <CheckChange Handler="var node = Ext.get(this.getView().getNode(item));
                                      node[checked ? 'addCls' : 'removeCls']('complete')" />
                                <Load Handler="GetTotal();" Delay="2000"></Load>
                               <%-- <Render Handler="#{TPPayIncome}.getRootNode().expand(false);" Delay="50" /> --%>
                                <AfterRender Handler="GetTotal();" Delay="2000"></AfterRender>
                            </Listeners>
                            <DockedItems>
                                <ext:Button ID="GetBack" runat="server" Dock="Bottom" Text="返回" OnDirectClick="GetBack_DirectClick">
                                </ext:Button>
                            </DockedItems>
                            <TopBar>
                                <ext:Toolbar runat="server" Layout="ColumnLayout">
                                    <Items>
                                        <ext:Label runat="server" Text="总余额剩余为：  "></ext:Label>
                                        <ext:Label ID="BAA" runat="server" Text=""></ext:Label>
                                        <ext:Label ID="Label3" runat="server" Text="万元"></ext:Label>
                                        <ext:Label PaddingSpec="0 0 0 10" runat="server" Text="追加金额剩余为：  "></ext:Label>
                                        <ext:Label ID="SUPP" runat="server" Text=""></ext:Label>
                                        <ext:Label ID="Label4" runat="server" Text="万元"></ext:Label> 
<%--                                        <ext:Panel runat="server" BaseCls="background:transeparent" MarginSpec="0 0 3 10">--%>
<%--                                            <Items>--%>
<%--                                                <ext:Button ID="Button1" runat="server" Text="关闭所有展开">--%>
<%--                                                    <Listeners>--%>
<%--                                                        <Click Handler="#{TPPayIncome}.collapseAll();" />--%>
<%--                                                    </Listeners>--%>
<%--                                                </ext:Button>--%>
<%--                                            </Items>--%>
<%--                                        </ext:Panel>--%>
                                    </Items>
                                </ext:Toolbar>
                            </TopBar> 
                        </ext:TreePanel>
                    </Items>
                </ext:FormPanel> 
            </Items> 
        </ext:Viewport> 
    </form>
</body>
</html>
