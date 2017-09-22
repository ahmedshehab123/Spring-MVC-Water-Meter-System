<head>

<title>Upload Cities File</title>
</head>
<%@ include file="header.jsp"%>

        <!-- page content -->
  <div class="right_col" role="main" style="min-height: 939px;">
  
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Upload File to cities for first logged  </h3>
              </div>

              <div class="title_right">
              
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>
<center> <h2 class="btn btn-danger btn-xs">${success}</h2></center>
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                
                  <div class="x_title">
                   
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  
                  <div class="x_content">
                   <p>Upload  files to the box below this is for intialize  the tree that help you when add device manual</p>
                   <div class="dz-default dz-message">
                    
                    
                    <center>
							<form action="savecountry" method="post" enctype="multipart/form-data">
							  <input type="file" class="btn btn-round btn-default" name="bulkfile" value="Upload CSV file" />
							  <button type="submit" class="btn btn-round btn-primary">Save</button>
							</form>
								
							</center>
                    
                    </div>
                    <br>
                    <br>
                    <br>
                    <br>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>
<!-- <script src="/WaterMeterMonitoringSystem/resources/vendors/dropzone/dist/min/dropzone.min.js"></script> -->
   <%@ include file="footer.jsp"%>