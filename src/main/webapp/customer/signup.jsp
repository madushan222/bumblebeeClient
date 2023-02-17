<%-- 
    Document   : signup
    Created on : 22 Aug 2022, 18:04:30
    Author     : shanr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <style>
            body{
                background-image: url("../media/index_01.jpg");
                background-repeat: no-repeat;
                background-size: cover;
            }
            
            label,p{
                
            }
        </style>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <script>
            $( function() {
                $( "#dob" ).datepicker({
                    changeMonth: true,
                    changeYear: true,
                    yearRange: "-80:+00",
                    dateFormat: 'yy-mm-dd'
                });
            } );
            
            // Age Validation
            function check_age(birthday)
            {
                // it will accept two types of format yyyy-mm-dd and yyyy/mm/dd
                var optimizedBirthday = birthday.replace(/-/g, "/");

                //set date based on birthday at 01:00:00 hours GMT+0100 (CET)
                var myBirthday = new Date(optimizedBirthday);

                // set current day on 01:00:00 hours GMT+0100 (CET)
                var currentDate = new Date().toJSON().slice(0,10)+' 01:00:00';

                // calculate age comparing current date and borthday
                var myAge = ~~((Date.now(currentDate) - myBirthday) / (31557600000));

                if(myAge < 18) {
                    $("#sub_btn").attr("disabled",true);
                    $("#dob_error").html("Your Age Must be over than 18");
                }else{
                    $("#sub_btn").attr("disabled",false);
                    $("#dob_error").html("");
                }
            }
        </script>
    </head>
    <body>
        <div class="row" style="margin-top:20px;">
             <div class="col-md-4">
             </div>
             <div class="col-md-4">    
                <form action="customerReg.jsp" method="POST">
                    <div class="form-group">
                      <label for="fName">First Name:</label>
                      <input type="text" class="form-control" id="fName" name="fName" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                      <label for="lName">Middle Name:</label>
                      <input type="text" class="form-control" id="mName" name="mName" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                      <label for="lName">Last Name:</label>
                      <input type="text" class="form-control" id="lName" name="lName" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                      <label for="nic">NIC:</label>
                      <input type="text" class="form-control" id="nic" name="nic" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                      <label for="dob">DOB</label>
                      <input type="text" class="form-control" id="dob" name="dob" autocomplete="off" onchange="check_age(this.value)" required>
                      <p id="dob_error" style="color:red"></p>
                    </div>
                     <div class="form-group">
                      <label for="address1">Address Line 1:</label>
                      <input type="text" class="form-control" id="address1" name="address1" autocomplete="off" required>
                    </div>
                     <div class="form-group">
                      <label for="address2">Address Line 2:</label>
                      <input type="text" class="form-control" id="address2" name="address2" autocomplete="off">
                    </div>
                    <div class="form-group">
                      <label for="address2">Address Line 3:</label>
                      <input type="text" class="form-control" id="address3" name="address3" autocomplete="off">
                    </div>
                    <div class="form-group">
                      <label for="mobile">Mobile:</label>
                      <input type="number" class="form-control" id="mobile" name="mobile" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                      <label for="email">Email address:</label>
                      <input type="email" class="form-control" id="email" name="email" autocomplete="off" required> 
                    </div>
                    <div class="form-group">
                      <label for="username">Username:</label>
                      <input type="text" class="form-control" id="username" name="username" autocomplete="off" required> 
                    </div>
                     <div class="form-group">
                      <label for="password">Password:</label>
                      <input type="password" class="form-control" id="password" name="password" autocomplete="off" required> 
                    </div>
                    <button type="submit" id="sub_btn" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-warning">Clear</button>
                </form>  
            </div>
        </div>
    </body>
</html>
