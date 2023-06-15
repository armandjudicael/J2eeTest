<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14/06/2023
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Nouveau Candidat</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
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
    .scrollable {
      max-height: 400px; /* Adjust the height as per your requirement */
      overflow-y: auto;
    }

    .error {
      color: red;
    }

    body{
      background:#E6E6FA
    }

  </style>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
  <!-- Bootstrap Select CSS -->
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />



</head>
<body>

<div class="container-fluid row justify-content-center align-items-center mt-5 mb-5">

  <div class=" col-md-8" >

    <div class="card h-100 ">
      <div class="card-body">
        <form id="form-nouveau-societe" action="PersonRessources" method="post" enctype="multipart/form-data" novalidate>
          <h4 class="card-title">Nouveau Candidat</h4>

          <!-- Nav tabs -->
          <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
              <button class="nav-link active" id="person-tab" data-bs-toggle="tab" data-bs-target="#person" type="button" role="tab" aria-controls="person" aria-selected="true">Person Information</button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="documents-tab" data-bs-toggle="tab" data-bs-target="#documents" type="button" role="tab" aria-controls="documents" aria-selected="false">Documents</button>
            </li>
          </ul>

          <!-- Tab panes -->
          <div class="tab-content mt-3" id="myTabContent">
            <div class="tab-pane fade show active" id="person" role="tabpanel" aria-labelledby="person-tab">
              <!-- Profile picture -->
              <div class="row">
                <div class="col-12 col-md-6 text-center">
                  <div id="uploaded-picture-container">
                    <img id="uploaded-picture" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Uploaded Picture">
                  </div>
                </div>
                <div class="col-12 col-md-6">
                  <label for="input-profil-picture" class="form-label mt-2">Please select an image</label>
                  <div class="text-center">
                    <input name="profil_picture" type="file" id="input-profil-picture" class="form-control">
                  </div>
                </div>
              </div>

              <!-- Personal details -->
              <div class="row mt-3">
                <div class="col-md-6">
                  <label for="input-nom" class="form-label">Nom</label>
                  <input name="nom" type="text" id="input-nom" class="form-control">
                </div>
                <div class="col-md-6">
                  <label for="input-nom" class="form-label">Prenom</label>
                  <input name="prenom" type="text" id="input-prenom" class="form-control">
                </div>
              </div>

              <!-- Address, contact, and email -->
              <div class="row mt-3">
                <div class="col-md-6">
                  <label for="input-adresse" class="form-label">Adresse</label>
                  <input name="adresse" type="text" id="input-adresse" class="form-control">
                </div>
                <div class="col-md-6">
                  <label for="input-contact" class="form-label">Contact</label>
                  <input name="contact" type="text" id="input-contact" class="form-control">
                </div>
              </div>

              <div class="row mt-3">
                <div class="col-md-6">
                  <label for="input-email" class="form-label">Email</label>
                  <input name="email" type="email" id="input-email" class="form-control">
                </div>
                <div class="col-md-6">
                  <label for="input-country" class="form-label">Country</label>
                  <select name="country" id="input-country" class="form-control">
                    <option value="">Select a country</option>
                    <option value="USA">United States</option>
                    <option value="CAN">Canada</option>
                    <option value="GBR">United Kingdom</option>
                    <option value="AUS">Australia</option>
                    <option value="GER">Germany</option>
                    <option value="FRA">France</option>
                    <option value="JPN">Japan</option>
                    <option value="CHN">China</option>
                    <option value="BRA">Brazil</option>
                    <option value="IND">India</option>
                  </select>
                </div>
              </div>

              <div class="row mt-3">
                  <div class="col-md-6">
                    <label for="softSkillsSelect">Soft Skills</label>
                    <select style="width: 350px" id="softSkillsSelect"></select>
                  </div>
                  <div class="col-md-6">
                        <div class="form-group">
                            <label for="job-select">Select Job:</label>
                            <select name="job" class="form-select" id="job-select">
                              <option value="">Select a job</option>
                              <option value="software-engineer">Software Engineer</option>
                              <option value="web-developer">Web Developer</option>
                              <option value="data-scientist">Data Scientist</option>
                              <option value="network-administrator">Network Administrator</option>
                              <option value="database-administrator">Database Administrator</option>
                              <option value="systems-analyst">Systems Analyst</option>
                              <option value="cybersecurity-specialist">Cybersecurity Specialist</option>
                              <!-- Add more job options in IT as needed -->
                            </select>
                        </div>
                    </div>
              </div>
              <!-- Rate and Pay rate -->
              <div class="row mt-3">
                <div class="col-md-6">
                  <label for="input-rate" class="form-label">Rate (1-10)</label>
                  <input name="rate" type="number" id="input-rate" class="form-control" min="1" max="10">
                </div>
                <div class="col-md-6">
                  <label for="pay-rate" class="form-label">Pay rate</label>
                  <input name="pay-rate" type="number" id="pay-rate" class="form-control">
                </div>
              </div>

              <!-- Slogan -->
              <div class="row mt-3">
                <div class="col-12">
                  <label for="description" class="form-label">Description</label>
                  <textarea id="description" name="description" class="form-control" rows="3"></textarea>
                </div>
              </div>
            </div>

            <!-- Documents tab -->
            <div class="tab-pane fade" id="documents" role="tabpanel" aria-labelledby="documents-tab">
              <!-- Document details -->
              <div class="row mt-3">
                <div class="col-12">
                  <div class="input-group">
                    <input name="attach-0" type="file" id="attach-0" class="form-control">
                    <button id="add-button" class="btn btn-primary" type="button">
                      <i class="bi bi-plus-circle-fill"></i> Add
                    </button>
                  </div>
                </div>
              </div>

              <!-- Document table -->
              <div class="row mt-3">
                <div class="col-12">
                  <table id="document-table-body" class="table">
                    <thead>
                    <tr>
                      <th>Document Name</th>
                      <th>Type</th>
                      <th>Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Add more rows as needed -->
                    </tbody>
                  </table>
                </div>
              </div>

              <!-- Add your code for other document-related inputs here -->
            </div>
           </div>

          <div class="text-center mt-4">
            <button id="btn-enregistrer-societe" type="submit" class="btn btn-primary">Enregistrer</button>
          </div>
          <div id="upload-documents" class="d-none">

          </div>
        </form>
      </div>
    </div>

  </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<!-- jQuery UI library -->
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

<script>
  $(document).ready(function() {

    var softSkills = [
      "Communication",
      "Leadership",
      "Teamwork",
      "Problem-solving",
      "Adaptability",
      "Time management",
      "Creativity",
      "Conflict resolution",
      "Decision-making",
      "Emotional intelligence"
    ];

    function initChoiceJS() {
      var selectElement = $('#softSkillsSelect');
      // Initialize Select2
      selectElement.select2({
        placeholder: 'Select soft skills',
        allowClear: true
      });

      // Populate options
      softSkills.forEach(function(skill) {
        var option = new Option(skill, skill);
        selectElement.append(option);
      });

    }

    initChoiceJS();

    var counter = 1;
    function initAddAttachButton() {

      $('#add-button').click(function() {
        // Get the selected file from the input field
        var fileInput = $('#attach-' + (counter - 1))[0];

        // Check if any file is selected
        if (fileInput.files.length === 0) {
          alert('Please select a file.');
          return;
        }

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

        2
        var newInput = $("<input>").attr({
          "name": "attach-" + counter,
          "type": "file",
          "id": "attach-" + counter,
          "class": "form-control"
        });

        // Move the old input field to the "upload-documents" div
        $('#upload-documents').append(fileInput);

        // Insert the new input field as a sibling before the "Add" button
        $('#add-button').before(newInput);

        counter++;
      });

    }
    initAddAttachButton();
    // PROFIL PICTURE
    $('#input-profil-picture').change(function(){
      var file = this.files[0];
      var fileType = file.type.toLowerCase();
      var allowedExtensions = ['jpeg', 'jpg', 'png', 'gif'];

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
