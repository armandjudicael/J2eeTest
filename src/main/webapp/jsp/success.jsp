<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Success Information Page</title>
    <%-- Bootstrap CSS --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <%-- Font Awesome CSS --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-6 offset-md-3 text-center mt-5">
            <h1 class="mb-4"><i class="fas fa-check-circle text-success"></i> The applicant ${name} is added successFully!</h1>
            <a href="PersonList" class="btn btn-primary mt-4">Go to List </a>
        </div>
    </div>
</div>

<%-- Bootstrap JS --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
