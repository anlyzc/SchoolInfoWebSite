<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProfessorList.aspx.cs" Inherits="university_UniversityList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" type="image/x-icon" href="/assets/startbootstrap-simple-sidebar-gh-pages/assets/favicon.ico" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/assets/startbootstrap-simple-sidebar-gh-pages/css/styles.css" rel="stylesheet" />
    <script src="/assets/startbootstrap-simple-sidebar-gh-pages/js/scripts.js"></script>
</head>
<body>
    <div class="d-flex" id="wrapper">
        <!-- Sidebar-->
        <div class="border-end bg-white" id="sidebar-wrapper">
            <div class="sidebar-heading border-bottom bg-light">Start Bootstrap</div>
            <div class="list-group list-group-flush">
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/university/UniversityList.aspx">University</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/faculty/FacultyList.aspx">Faculty</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/major/MajorList.aspx">Major</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/student/StudentList.aspx">Student</a>
                <a class="list-group-item list-group-item-action list-group-item-light p-3" href="/professor/ProfessorList.aspx">Professor</a>
            </div>
        </div>
        <!-- Page content wrapper-->
        <div id="page-content-wrapper">
            <!-- Top navigation-->
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                <div class="container-fluid">
                    <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                            <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#!">Action</a>
                                    <a class="dropdown-item" href="#!">Another action</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#!">Something else here</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <div class="container-fluid">
                <div class="row">
                    <div class="col lg-12">
                        <form id="form2" runat="server">
                            <div class="form-group">
                                <h3>Professor List</h3>
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Professor Name</th>
                                            <th scope="col">Major Name</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="professorList" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("ProfID") %></td>
                                                    <td><%# Eval("ProfName") %></td>
                                                    <td><%# GetMajorName(Convert.ToInt32(Eval("MajorID"))) %></td>
                                                    <td>
                                                        <asp:HyperLink NavigateUrl='<%# "DeleteProfessor.aspx?id=" + Eval("ProfID") %>' runat="server" CssClass="btn btn-danger">Delete</asp:HyperLink>
                                                        <asp:HyperLink NavigateUrl='<%# "UpdateProfessor.aspx?id=" + Eval("ProfID") %>' runat="server" CssClass="btn btn-success">Update</asp:HyperLink>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                                <a href="/professor/InsertProfessor.aspx" class="btn btn-primary">Add professor</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

