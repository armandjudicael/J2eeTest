<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/06/2023
  Time: 07:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>candidate list</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>

        .error {
            color: red;
        }

        body{
            background:#E6E6FA
        }
        .card {
            box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
        }

        .avatar-md {
            height: 5rem;
            width: 5rem;
        }

        .fs-19 {
            font-size: 19px;
        }

        .primary-link {
            color: #314047;
            -webkit-transition: all .5s ease;
            transition: all .5s ease;
        }

        a {
            color: #02af74;
            text-decoration: none;
        }

        .bookmark-post .favorite-icon a, .job-box.bookmark-post .favorite-icon a {
            background-color: #da3746;
            color: #fff;
            border-color: danger;
        }

        .favorite-icon a {
            display: inline-block;
            width: 30px;
            height: 30px;
            font-size: 18px;
            line-height: 30px;
            text-align: center;
            border: 1px solid #eff0f2;
            border-radius: 6px;
            color: rgba(173,181,189,.55);
            -webkit-transition: all .5s ease;
            transition: all .5s ease;
        }

        .candidate-list-box .favorite-icon {
            position: absolute;
            right: 22px;
            top: 22px;
        }
        .fs-14 {
            font-size: 14px;
        }
        .bg-soft-secondary {
            background-color: rgba(116,120,141,.15)!important;
            color: #74788d!important;
        }

        .mt-1 {
            margin-top: 0.25rem!important;
        }

        #uploaded-picture-container {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            overflow: hidden;
            margin-top: 10px;
        }

        #uploaded-picture {
            width: 100%;
            height: auto;
        }

    </style>
</head>
<body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<section class="section">
    <div class="container">
        <div class="justify-content-center row mt-5">
            <div class="col-lg-12">
                <div class="candidate-list-widgets mb-4">
                    <form action="#" class>
                        <div class="g-2 row">
                            <div class="col-lg-9">
                                <div class="filler-job-form">
                                    <i class="uil uil-briefcase-alt"></i><input id="exampleFormControlInput1" placeholder="Job, Company name... " type="search" class="form-control filler-job-input-box form-control" />
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div>
                                    <a class="btn btn-primary" href="#"><i class="uil uil-filter"></i> Filter</a>
                                    <a class="btn btn-success ms-2" data-bs-toggle="modal" data-bs-target="#new-person"><i class="bi bi-plus-circle"></i> Nouveau </a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="align-items-center row">
                    <div class="col-lg-4">
                        <div class="candidate-list-widgets">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="selection-widget">
                                        <select class="form-select" data-trigger="true" name="choices-single-filter-orderby" id="choices-single-filter-orderby" aria-label="Default select example">
                                            <option value="df">Default</option>
                                            <option value="ne">Newest</option>
                                            <option value="od">Oldest</option>
                                            <option value="rd">Random</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="selection-widget mt-2 mt-lg-0">
                                        <select class="form-select" data-trigger="true" name="choices-candidate-page" id="choices-candidate-page" aria-label="Default select example">
                                            <option value="df">All</option>
                                            <option value="ne">8 per Page</option>
                                            <option value="ne">12 per Page</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="candidate-list">
                    <c:forEach var="person" items="${personList}">
                        <div class="candidate-list-box card mt-4">
                            <div class="p-4 card-body">
                                <!-- Candidate information row -->
                                <div class="align-items-center row">
                                    <div class="col-auto">
                                        <!-- Candidate avatar -->
                                        <div class="candidate-list-images">
                                            <a href="#"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt class="avatar-md img-thumbnail rounded-circle" /></a>
                                        </div>
                                    </div>
                                    <div class="col-lg-5">
                                        <!-- Candidate details -->
                                        <div class="candidate-list-content mt-3 mt-lg-0">
                                            <h5 class="fs-19 mb-0">
                                                <a class="primary-link" href="#">${person.nom} ${person.prenom}</a>
                                                <span class="badge bg-success ms-1"><i class="mdi mdi-star align-middle"></i>4.8</span>
                                            </h5>
                                            <p class="text-muted mb-2">${person.field}</p>
                                            <ul class="list-inline mb-0 text-muted">
                                                <li class="list-inline-item"><i class="mdi mdi-map-marker"></i> ${person.address}</li>
                                                <li class="list-inline-item"><i class="mdi mdi-wallet"></i> ${person.rate} / hour</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="mt-2 mt-lg-0 d-flex flex-wrap align-items-start gap-1">
                                            <c:forEach var="skill" items="${person.skills}">
                                                <span class="badge bg-soft-secondary fs-14 mt-1">${skill}</span>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="col-lg-2">
                                        <!-- Candidate icons -->
                                        <div class="mt-2 mt-lg-0 d-flex flex-wrap align-items-start gap-1">
                                            <button class="btn btn-danger" onclick="deleteCandidate()"><i class="mdi mdi-delete"></i></button>
                                            <button class="btn btn-primary" onclick="editCandidate()"><i class="mdi mdi-pencil"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion mt-3" id="candidate-accordion">
                                    <div class="accordion-item">
                                        <!-- Accordion header -->
                                        <h2 class="accordion-header" id="headingOne">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                Additional Details
                                            </button>
                                        </h2>
                                        <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#candidate-accordion">
                                            <div class="accordion-body">
                                                <!-- Accordion content -->
                                                <ul class="nav nav-tabs" id="candidate-tabs" role="tablist">
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link active" id="info-tab" data-bs-toggle="tab" data-bs-target="#info" type="button" role="tab" aria-controls="info" aria-selected="true">Info</button>
                                                    </li>
                                                    <li class="nav-item" role="presentation">
                                                        <button class="nav-link" id="documents-tab1" data-bs-toggle="tab" data-bs-target="#documents1" type="button" role="tab" aria-controls="documents" aria-selected="false">Documents</button>
                                                    </li>
                                                </ul>
                                                <div class="tab-content mt-3" id="candidate-tab-content">
                                                    <!-- Info tab -->
                                                    <div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
                                                        <ul class="list-group list-group-flush">
                                                            <li class="list-group-item">Education: Bachelor's Degree</li>
                                                            <li class="list-group-item">Experience: 5+ years</li>
                                                            <li class="list-group-item">Skills: Project Management, Leadership, Communication</li>
                                                        </ul>
                                                    </div>
                                                    <!-- Documents tab -->
                                                    <div class="tab-pane fade" id="documents1" role="tabpanel" aria-labelledby="documents-tab">
                                                        <table class="table">
                                                            <thead>
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Action</th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            <c:forEach var="attach" items="${person.attachements}">
                                                                <tr>
                                                                    <td>${attach.key}</td>
                                                                    <td>
                                                                        <a href="#">View</a>
                                                                        <a href="#">Download</a>
                                                                    </td>
                                                                </tr>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="mt-4 pt-2 col-lg-12">
                <nav aria-label="Page navigation example">
                    <div class="pagination job-pagination mb-0 justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" tabindex="-1" href="#"><i class="mdi mdi-chevron-double-left fs-15"></i></a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#"><i class="mdi mdi-chevron-double-right fs-15"></i></a>
                        </li>
                    </div>
                </nav>
            </div>
        </div>
        <!-- /.modal -->
    </div>
</section>

<tags:new-person-modal/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<!-- jQuery UI library -->
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script>
    $(document).ready(function() {

        // Pagination settings
        const itemsPerPage = 10; // Number of items to display per page
        let currentPage = 1; // Current page number
        const totalPages = 4; // Total number of pages

        // Display the current page
        function displayCurrentPage() {
            $('.pagination .page-item').removeClass('active');
            $('.pagination .page-item:eq(' + currentPage + ')').addClass('active');

            // TODO: Update the content based on the current page
            // Example: Show/hide relevant content or make an AJAX request
        }
        // Handle previous page event
        function goToPreviousPage() {
            if (currentPage > 1) {
                currentPage--;
                displayCurrentPage();
            }
        }

        // Handle next page event
        function goToNextPage() {
            if (currentPage < totalPages) {
                currentPage++;
                displayCurrentPage();
            }
        }

        // Handle specific page number event
        function goToPage(pageNumber) {
            if (pageNumber >= 1 && pageNumber <= totalPages) {
                currentPage = pageNumber;
                displayCurrentPage();
            }
        }

        // Example event listeners using jQuery
        $('.pagination .page-item:first-child').on('click', goToPreviousPage);
        $('.pagination .page-item:last-child').on('click', goToNextPage);
        $('.pagination .page-item:not(:first-child):not(:last-child)').on('click', function() {
            const pageNumber = parseInt($(this).text());
            goToPage(pageNumber);
        });

        // Initial display
        displayCurrentPage();

        $('#add-button').click(function() {
            // Get the selected file from the input field
            var fileInput = $('#input-logo')[0];
            var file = fileInput.files[0];

            // Check for duplicate filenames
            var isDuplicate = false;
            $('#document-table-body tr').each(function() {
                var documentName = $(this).find('td:first').text();
                if (documentName === file.name) {
                    isDuplicate = true;
                    return false; // Exit the loop if a duplicate is found
                }
            });

            if (isDuplicate) {
                alert('Duplicate file detected. Please choose a different file.');
                return; // Abort adding the file to the table
            }

            // Create a new row in the table
            var newRow = $('<tr></tr>');

            // Create cells for the table row
            var documentNameCell = $('<td></td>').text(file.name);
            var typeCell = $('<td></td>').text(file.name.split('.').pop()); // Display the file extension in the 'Type' column
            var dateCell = $('<td></td>').text(new Date().toISOString().split('T')[0]);

            // Append cells to the new row
            newRow.append(documentNameCell, typeCell, dateCell);

            // Append the new row to the table body
            $('#document-table-body').append(newRow);

            // Clear the file input field
            fileInput.value = "";
        });


        // PROFIL PICTURE

        $('#input-profil-picture').change(function(){
            var file = this.files[0];
            var fileType = file.type.toLowerCase();
            var allowedExtensions = ['jpeg', 'jpg', 'png', 'gif'];

            // if (allowedExtensions.indexOf(fileType) === -1) {
            //     // Clear the input field if the selected file is not an image
            //     $(this).val('');
            //     alert('Please select a valid image file (JPEG, JPG, PNG, or GIF).');
            // } else {
                var reader = new FileReader();
                reader.onloadend = function() {
                    $('#uploaded-picture').attr('src', reader.result);
                }
                if (file) {
                    reader.readAsDataURL(file);
                }
            // }
        });

        // FROM VALIDATION

        $('#form-nouveau-societe').validate({
            rules: {
                nom: 'required',
                prenom: 'required',
                adresse: 'required',
                contact: 'required',
                email: {
                    required: true,
                    email: true
                },
                rate: {
                    required: true,
                    range: [1, 10]
                },
                'pay-rate': 'required',
                country: 'required',
                description: {
                    required: true
                }
            },
            messages: {
                nom: 'Please enter your Nom',
                prenom: 'Please enter your Prenom',
                adresse: 'Please enter your Adresse',
                contact: 'Please enter your Contact',
                email: {
                    required: 'Please enter your Email',
                    email: 'Please enter a valid Email'
                },
                rate: {
                    required: 'Please enter a Rate',
                    range: 'Rate must be between 1 and 10'
                },
                'pay-rate': 'Please enter Pay Rate',
                country: 'Please select a Country',
                description: {
                    required: "Please enter a description"
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });

    });
</script>
</body>
</html>
