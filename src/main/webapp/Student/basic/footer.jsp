
<%@ page import = "java.io.*,java.util.*" %>
<footer class="text-center text-lg-start ">
  <!-- Section: Social media -->
  <section
    class="d-flex justify-content-center justify-content-lg-between p-2 border-bottom fs-6"style="background-color:rgba(117, 154, 255, 0.89);">
    <!-- Left -->
    <div class="me-5 d-none d-lg-block ">
     <%
            // Get current time
            Calendar calendar = new GregorianCalendar();
            String am_pm;     
            int hour = calendar.get(Calendar.HOUR);
            int minute = calendar.get(Calendar.MINUTE);
            int second = calendar.get(Calendar.SECOND);
            if(calendar.get(Calendar.AM_PM) == 0)
               am_pm = "AM";
            else
               am_pm = "PM";
            String CT = hour+":"+ minute +":"+ second +" "+ am_pm;
         %>
      <span><% out.println("Current Time: " + CT + "\n"); %>______Get connected with us on social networks:</span>
    </div>
    <!-- Left -->
    <!-- Right -->
    <div>
      <a href="http://www.facebook.com/" class="me-4 text-reset">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="https://twitter.com/" class="me-4 text-reset">
        <i class="fab fa-twitter"></i>
      </a>
      <a href="https://google.com" class="me-4 text-reset">
        <i class="fab fa-google"></i>
      </a>
      <a href="https://www.instagram.com/" class="me-4 text-reset">
        <i class="fab fa-instagram"></i>
      </a>
      <a href="https://linkedin.com/" class="me-4 text-reset">
        <i class="fab fa-linkedin"></i>
      </a>
      <a href="http://github.com/" class="me-4 text-reset">
        <i class="fab fa-github"></i>
      </a>
    </div>
    <!-- Right -->
  </section>
  <!-- Section: Social media -->

  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-2">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-7 col-lg-7 col-xl-5 mx-auto   mb-4">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
            <i class="fas fa-gem me-3"></i>Education Management System
          </h6>
          <p>
            The Education  Management System is a web-based system which will use as a platform for interaction between student, teachers and parents. 
          </p>
        </div>
        <!-- Grid column -->
        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Contact
          </h6>
          <p><i class="fas fa-home me-3"></i> New Delhi  110012, India</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            surajsingh12821@example.com
          </p>
          <p><i class="fas fa-phone me-3"></i> +91 9310919952</p>
         
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <div class="text-center p-2 "style="background-color:rgba(117, 154, 255, 0.89);">
    E-M-S © 2021 Copyright:
    <a class="text-reset fw-bold" href="https://mdbootstrap.com/">Education Management System</a>
  </div>
  <!-- Copyright -->
</footer>
