<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="袁蕾">
    <title>Movie View</title>

    <!-- custom css file link  -->
    <link rel="stylesheet" href="../css/styleA.css">

</head>
<body>

<!-- header section starts  -->

<jsp:include page="navigationBar.jsp"></jsp:include>

<!-- header section ends -->

<!-- home section starts  -->

<section class="home" id="home">

    <div class="image">
        <img src="../image/unicorn3.png" alt="">
    </div>

    <div class="content">
        <span>speific and vivid</span>
        <h3>your movie needs view</h3>
        <a href="#view" class="btn">get started</a>
    </div>

</section>

<!-- home section ends -->

<!-- banner section starts  -->

<section class="banner-container">
    <div class="banner">
        <img src="../image/background4.jpg" alt="">
        <div class="content">
            <h3>JSP1</h3>
            <p>You can an analysis of the jsp1</p>
            <a href="jsp1.jsp" class="btn">enter</a>
        </div>
    </div>

    <div class="banner">
        <img src="../image/background1.jpg" alt="">
        <div class="content">
            <a name="view"></a>
            <h3>JSP2</h3>
            <p>You can an analysis of the jsp2</p>
            <a href="jsp2.jsp" class="btn">Enter</a>
        </div>
    </div>

    <div class="banner">
        <img src="../image/background.jpg" alt="">
        <div class="content">
            <h3>JSP3</h3>
            <p>You can an analysis of the jsp3</p>
            <a href="jsp3.jsp" class="btn">enter</a>
        </div>
    </div>

    <div class="banner">
        <img src="../image/background3.jpg" alt="">
        <div class="content">
            <h3>JSP4</h3>
            <p>You can an analysis of the jsp4</p>
            <a href="jsp4.jsp" class="btn">enter</a>
        </div>
    </div>

</section>

<!-- banner section ends -->

<!-- custom js file link  -->
<script src="../js/scriptA.js"></script>

</body>
</html>
