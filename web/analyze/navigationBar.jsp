<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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

<header>
    <div class="header-2">

        <div id="menu-bar"></div>

        <nav class="navbar">
            <a href="index.jsp">HOME</a>
            <a href="jsp1.jsp">Rank</a>
            <a href="jsp2.jsp">Len</a>
            <a href="jsp3.jsp">Count</a>
            <a href="jsp4.jsp">Year</a>
            <a href="jsp5.jsp">Prime</a>
        </nav>

        <div class="dropdown">
            <button class="dropbtn">${user.getName()}</button>
            <div class="dropdown-content">
                <a href="../Exit">Exit</a>
            </div>
        </div>

    </div>

</header>

</body>
</html>
