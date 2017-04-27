<%-- 
    Document   : home
    Created on : Dec 4, 2016, 2:38:09 PM
    Author     : saumiko
--%>
<% response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
    /*HTTP 1.1*/ response.setHeader("Pragma", "no-cache");
    /*HTTP 1.0*/ response.setDateHeader("Expires", -1);
 %>
<%@page import="DBMS.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>SUST CSE Social Network</title>
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.6 -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <!-- jvectormap -->
        <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <!-- এইখানে User এর হাবিজাবি জিনিসপাতি নিয়ে আসবো -->
    <%
        loginid lid = null;
        lid = (loginid)session.getAttribute("lid");
        int id = lid.getId();
        String name = lid.getName();
        HomeUserInfo userInfo = new HomeUserInfo();
        ProfileEditDB myImage = new ProfileEditDB();
        String myPhoto = myImage.getMyImage(id);
    %>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <header class="main-header">

                <!-- Logo -->
                <a href="home.jsp" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <span class="logo-mini"><b>SUST</b></span>
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>SUST CSE</b>Social Network</span>
                </a>

                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-envelope-o"></i>
                                    <span class="label label-success"><!-- কয়টা মেসেজ সেটা লেখা থাকবে --></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have <!-- কয়টা মেসেজ সেটা লেখা থাকবে --> messages</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">                                                     
<!--                                            <li>
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <h4>
                                                        AdminLTE Design Team
                                                        <small><i class="fa fa-clock-o"></i> 2 hours</small>
                                                    </h4>
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <h4>
                                                        Developers
                                                        <small><i class="fa fa-clock-o"></i> Today</small>
                                                    </h4>
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <h4>
                                                        Sales Department
                                                        <small><i class="fa fa-clock-o"></i> Yesterday</small>
                                                    </h4>
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <div class="pull-left">
                                                        <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                                                    </div>
                                                    <h4>
                                                        Reviewers
                                                        <small><i class="fa fa-clock-o"></i> 2 days</small>
                                                    </h4>
                                                    <p>Why not buy a new awesome theme?</p>
                                                </a>
                                            </li>-->
                                        </ul>
                                    </li>
                                    <li class="footer"><a href="#">See All Messages</a></li>
                                </ul>
                            </li>
                            <!-- Notifications: style can be found in dropdown.less -->
                            <li class="dropdown notifications-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-bell-o"></i>
                                    <span class="label label-warning"><!-- কয়টা Notification সেটা লেখা থাকবে --></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="header">You have <!-- কয়টা Notification সেটা লেখা থাকবে --> notifications</li>
                                    <li>
                                        <!-- inner menu: contains the actual data -->
                                        <ul class="menu">
<!--                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                                                    page and may cause design problems
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-users text-red"></i> 5 new members joined
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                                                </a>
                                            </li>
                                            <li>
                                                <a href="#">
                                                    <i class="fa fa-user text-red"></i> You changed your username
                                                </a>
                                            </li>-->
                                        </ul>
                                    </li>
                                    <li class="footer"><a href="#">View all</a></li>
                                </ul>
                            </li>
                            <!-- Tasks: style can be found in dropdown.less -->
                            <!-- User Account: style can be found in dropdown.less -->
                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="<%=myPhoto%>" class="user-image" alt="User Image">
                                    <span class="hidden-xs"><%=name%></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <!-- User image -->
                                    <li class="user-header">
                                        <img src="<%=myPhoto%>" class="img-circle" alt="User Image">

                                        <p>
                                            <%=name%>
                                            <small><%=userInfo.getUserType(id)%></small>
                                        </p>
                                    </li>
                                    <!-- Menu Footer-->
                                    <li class="user-footer">
                                        <div class="pull-left">
                                            <a href="myProfile.jsp" class="btn btn-default btn-flat">Profile</a>
                                        </div>
                                        <div class="pull-right">
                                            <form action="LogoutServlet" method="POST">
                                                <button type="submit" class="btn btn-default btn-flat">Sign out</button>
                                            </form>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </nav>
            </header>
            <!-- Left side column. contains the logo and sidebar -->
            <aside class="main-sidebar">
                <!-- sidebar: style can be found in sidebar.less -->
                <section class="sidebar">
                    <!-- Sidebar user panel -->
                    <div class="user-panel">
                        <div class="pull-left image">
                            <img src="<%=myPhoto%>" class="img-circle" alt="User Image">
                        </div>
                        <div class="pull-left info">
                            <p><%=name%></p>
                            <!--User Type-->
                            <p><i class="fa fa-circle text-success"></i> <%=userInfo.getUserType(id)%></p>
                        </div>
                    </div>
                    <!-- sidebar menu: : style can be found in sidebar.less -->
                    <ul class="sidebar-menu">
                        <li class="header">Menu</li>
                        <li class="treeview">
                            <a href="#">
                                <i class="fa fa-home"></i> <span>Home</span>
                                <span class="pull-right-container">
                                    <i class="fa fa-angle-left pull-right"></i>
                                </span>
                            </a>
                            <ul class="treeview-menu">
                                <li><a href="#"><i class="fa fa-circle-o"></i> Friends</a></li>
                                <li><a href="#"><i class="fa fa-circle-o"></i> Class</a></li>
                            </ul>
                        </li>
                        <li class="treeview">
                            <a href="editProfile.jsp">
                                <i class="fa fa-pencil-square-o"></i>
                                <span>Edit Profile</span>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="fa fa-envelope"></i> <span>Mailbox</span>
                                <span class="pull-right-container">
                                    <small class="label pull-right bg-red"><!--কতগুলা মেসেজ আসছে সেইটা দেখানো লাগবে।--></small>
                                </span>
                            </a>
                        </li>
                        <li class="header">Groups
                            <span class="pull-right-container">
                            <a href = "addNewGroup.jsp"><i class="fa fa-plus pull-right"></i></a>
                        </span>
                        
                        </li>
                        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>SUST CSE Batch 2012</span></a></li>
                        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>\লুহা/ [আশাযোগ্য নহে]</span></a></li>
                        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Unilever G-2</span></a></li>
                    </ul>
                </section>
                <!-- /.sidebar -->
            </aside>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Create New Group
                    </h1>
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class = "col-md-8">
                    <div class="box box-info">
                        <div class="box-header with-border">
                          <h3 class="box-title">Add Group Information</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form class="form-horizontal">
                          <div class="box-body">
                            <div class="form-group">
                              <label for="GroupName" class="col-sm-2 control-label">Group Name</label>

                              <div class="col-sm-10">
                                <input type="text" name="groupName" class="form-control" id="GroupName" placeholder="ex: SUST CSE 2012">
                              </div>
                            </div>
                            <div class="form-group">
                                <label for="GroupDescription" class="col-sm-2 control-label">Add a description</label>
                                <div class="col-sm-10">
                                <textarea id="GroupDescription" class="form-control" rows="5" maxlength="500" placeholder="Enter a description about your group"></textarea>
                                <div class="pull-right"><span id="desChar">0</span>/500</div>
                                <script>
                                    $(document).ready(function() {
                                        var text_max = 500;
                                        $('#desChar').html(text_max);

                                        $('#GroupDescription').keyup(function() {
                                            var text_length = $('#GroupDescription').val().length;
                                            var text_remaining = text_max - text_length;
                                            
                                            $('#desChar').html(text_remaining);
                                        });
                                    });
                                </script>
                                </div>
                            </div>
                          </div>
                          <!-- /.box-body -->
                          <div class="box-footer">
                            <a class="btn btn-default" href="home.jsp">Cancel</a>
                            <button type="submit" class="btn btn-info pull-right">Create Group</button>
                          </div>
                          <!-- /.box-footer -->
                        </form>
                      </div>
                </section>
                <!-- /.content -->
            </div>
            </div>
            <!-- /.content-wrapper -->

            <footer class="main-footer">
                <div class="pull-right hidden-xs">
                    <b>Alpha</b> Version 
                </div>
                <strong>Copyright &copy; 2016 <a href="http://www.sust.edu">Shahjalal University of Science & Technology</a>.</strong> All rights
                reserved.
            </footer>


        </div>
        <!-- ./wrapper -->

        <!-- jQuery 2.2.3 -->
        <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
        <!-- Bootstrap 3.3.6 -->
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="plugins/fastclick/fastclick.js"></script>
        <!-- AdminLTE App -->
        <script src="dist/js/app.min.js"></script>
        <!-- Sparkline -->
        <script src="plugins/sparkline/jquery.sparkline.min.js"></script>
        <!-- jvectormap -->
        <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
        <!-- SlimScroll 1.3.0 -->
        <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <!-- ChartJS 1.0.1 -->
        <script src="plugins/chartjs/Chart.min.js"></script>
        <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
        <script src="dist/js/pages/dashboard2.js"></script>
        <!-- AdminLTE for demo purposes -->
        <script src="dist/js/demo.js"></script>
    </body>
</html>
