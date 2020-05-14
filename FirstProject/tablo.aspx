<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tablo.aspx.cs" Inherits="FirstProject.tablo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="style.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />


</head>
<body>
    <nav>
        <div class="toggleee" style="width: 100%; padding: 10px 20px; background: #001f44; text-align: right; box-sizing: border-box; color: #fff; font-size: 30px; display: none;">
            <i class="fa fa-bars" aria-hidden="true"></i>
        </div>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">Account</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">Quote</a></li>
            <li><a href="#">Order</a></li>
        </ul>

    </nav>
    <form id="form1" runat="server">
        <div style="margin-bottom: 10px; text-align: right;">
             <input class="form-control mr-sm-2" id="SearchInput" type="text" placeholder="Search"/>
            <button type="button" style="padding: 5px" class="btn btn-danger" id="btn_all_sil" name="btn_all_sil"><i class="fa fa-trash"></i>All Delete</button>
        </div>
        <div>
            <table class="table table-hover table-striped" id="employeeTable" style="padding: 20px;">
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">
                            <input type="checkbox" id="checkedAll" />
                        </th>
                        <th scope="col">AD SOYAD</th>
                        <th scope="col">POZİSYON</th>
                        <th scope="col">OFİS</th>
                        <th scope="col">MAAŞ</th>
                        <th scope="col" style="display: none;"></th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody id="TableTbody">

                    <asp:Repeater runat="server" ID="repeater">
                        <ItemTemplate>
                            <tr id="tr_<%# Eval("EmployeeID") %>">
                                <th scope="row">1</th>
                                <td>
                                    <input type="checkbox" class="checkSingle" id="del_<%# Eval("EmployeeID") %>" />
                                </td>
                                <td><%# Eval("Name") %></td>
                                <td><%# Eval("Position") %></td>
                                <td><%# Eval("Office") %></td>
                                <td><%# Eval("Salary") %></td>
                                <td style="display: none;"><%# Eval("EmployeeID") %></td>
                                <td>

                                    <button type="button" class="btn btn-danger" id="btn_sil" name="btn_sil" onclick="deleteRow(this)"><i class="fa fa-trash"></i></button>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg" onclick="GetRow(this)"><i class="fa fa-edit"></i></button>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>



        <div class="modal fade bd-example-modal-lg" id="EditModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Güncelle</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <input runat="server" type="hidden" class="form-control" id="EditInputId" aria-describedby="emailHelp" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputFullName">Ad Soyad</label>
                            <input runat="server" type="text" class="form-control" id="EditInputFullName" aria-describedby="emailHelp" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPosition">Pozisyon</label>
                            <input runat="server" type="text" class="form-control" id="EditInputPosition" aria-describedby="emailHelp" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputOffice">Ofis</label>
                            <input runat="server" type="text" class="form-control" id="EditInputOffice" aria-describedby="emailHelp" />
                        </div>
                        <div class="form-group">
                            <label for="exampleInputSalary">Maaş</label>
                            <input runat="server" type="text" class="form-control" id="EditInputSalary" aria-describedby="emailHelp" />
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="editRow()">Save changes</button>
                    </div>


                </div>
            </div>
        </div>
    </form>
</body>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="jquery-3.5.0.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        $('#btn_all_sil').click(function () {
            var post_arr = [];
            $('#employeeTable .checkSingle').each(function () {
                if (jQuery(this).is(":checked")) {
                    var id = this.id;
                    var splitid = id.split('_');
                    var postid = splitid[1];
                    post_arr.push(postid);
                }
            });
            if (post_arr.length > 0) {
                var isDelete = confirm("Do you really want to delete records?");
                if (isDelete == true) {
                    for (var i = 0; i < post_arr.length; i++) {
                        $.ajax({
                            contentType: "application/json",
                            url: 'tablo.aspx/DeleteDatas',
                            type: 'POST',
                            data: "{'id':'" + post_arr[i] + "'}",
                            success: function (data) {
                                $.each(post_arr, function (i, l) {
                                    $("#tr_" + l).remove();
                                });
                            },
                            error: function () {
                                alert("Hata çıktı");
                            }
                        });
                    }
                }
            } else {
                alert("lütfen seçim yapınız");
            }
        });

        $("#checkedAll").change(function () {
            if (this.checked) {
                $(".checkSingle").each(function () {
                    this.checked = true;
                });
            } else {
                $(".checkSingle").each(function () {
                    this.checked = false;
                });
            }
        });

        $(".checkSingle").click(function () {
            if ($(this).is(":checked")) {
                var isAllChecked = 0;

                $(".checkSingle").each(function () {
                    if (!this.checked)
                        isAllChecked = 1;
                });

                if (isAllChecked == 0) {
                    $("#checkedAll").prop("checked", true);
                }
            }
            else {
                $("#checkedAll").prop("checked", false);
            }
        });

        $("#SearchInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#TableTbody tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

    function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        var id = document.getElementById("employeeTable").rows[i].cells[6].innerHTML;
        $.ajax({
            contentType: "application/json",
            url: "tablo.aspx/DeleteData",
            type: 'POST',
            data: "{'id':'" + id + "'}",
            success: function (data) {
                alert("Kayıt silindi.");
                document.getElementById("employeeTable").deleteRow(i);
            }
        });
    }

    function editRow() {
        var id = document.getElementById("EditInputId");
        var name = document.getElementById("EditInputFullName");
        var position = document.getElementById("EditInputPosition");
        var office = document.getElementById("EditInputOffice");
        var salary = document.getElementById("EditInputSalary");
        $.ajax({
            contentType: "application/json",
            url: "tablo.aspx/EditData",
            type: 'POST',
            data: "{'id':'" + id.value + "','name':'" + name.value + "','position':'" + position.value + "','office':'" + office.value + "','salary':'" + salary.value + "'}",
            success: function (data) {
                setTimeout(function () {
                    location.reload();
                }, 100);
                $("#EditModal .close").click();
            }
        });
    }

    function GetRow(row) {
        var i = row.parentNode.parentNode.rowIndex;
        var name = document.getElementById("employeeTable").rows[i].cells[2].innerHTML;
        var position = document.getElementById("employeeTable").rows[i].cells[3].innerHTML;
        var office = document.getElementById("employeeTable").rows[i].cells[4].innerHTML;
        var salary = document.getElementById("employeeTable").rows[i].cells[5].innerHTML;
        var id = document.getElementById("employeeTable").rows[i].cells[6].innerHTML;
        $("#EditInputId").val(id);
        $("#EditInputFullName").val(name);
        $("#EditInputPosition").val(position);
        $("#EditInputOffice").val(office);
        $("#EditInputSalary").val(salary);
    }

</script>

<%--<script type="text/javascript">
    $(document).ready(function () {
        $('.menu').click(function () {
            $('ul').toggleClass('active');
        });
    });
</script>--%>
</html>

