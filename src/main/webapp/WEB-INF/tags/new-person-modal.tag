<!-- Standard modal -->
<div id="new-person" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="standard-modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <form id="form-nouveau-societe" action="PersonRessources" method="post" class="modal-content" enctype="multipart/form-data" novalidate>
            <!-- Modal header -->
            <div class="modal-header">
                <h4 class="modal-title">Nouveau Candidat</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
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
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="person" role="tabpanel" aria-labelledby="person-tab">
                        <!-- Profile picture -->
                        <div class="mb-1 d-flex align-items-center">
                            <div class="row">
                                <div class="col-12 col-md-6 text-center">
                                    <!-- Display uploaded image -->
                                    <div id="uploaded-picture-container">
                                        <img id="uploaded-picture" src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Uploaded Picture">
                                    </div>
                                </div>
                                <div class="col-12 col-md-6 text-center">
                                    <label for="input-profil-picture" class="form-label mt-2">Please select an image</label>
                                    <div class="text-center">
                                        <input name="profil_picture" type="file" id="input-profil-picture" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Company details -->
                        <div class="mb-1">
                            <!-- Company name -->
                            <div class="row">
                                <div class="col-6">
                                    <label for="input-nom" class="form-label">Nom</label>
                                    <input name="nom" type="text" id="input-nom" class="form-control">
                                </div>
                                <div class="col-6">
                                    <label for="input-nom" class="form-label">Prenom</label>
                                    <input name="prenom" type="text" id="input-prenom" class="form-control">
                                </div>
                            </div>
                        </div>

                        <!-- Address, contact, and email -->
                        <div class="mb-1">
                            <div class="row">
                                <div class="col-6">
                                    <label for="input-adresse" class="form-label">Adresse</label>
                                    <input name="adresse" type="text" id="input-adresse" class="form-control">
                                </div>
                                <div class="col-6">
                                    <label for="input-contact" class="form-label">Contact</label>
                                    <input name="contact" type="text" id="input-contact" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="mb-1">
                            <div class="row">
                                <div class="col-6">
                                    <label for="input-email" class="form-label">Email</label>
                                    <input name="email" type="email" id="input-email" class="form-control">
                                </div>
                                <div class="col-6">
                                    <label for="input-country" class="form-label">Country</label>
                                    <select name="country" id="input-country" class="form-control">
                                        <option value="">Select a country</option>
                                        <option value="USA">USA</option>
                                        <option value="Canada">Canada</option>
                                        <option value="UK">UK</option>
                                        <option value="Australia">Australia</option>
                                        <option value="Germany">Germany</option>
                                        <option value="France">France</option>
                                        <option value="Italy">Italy</option>
                                        <option value="Spain">Spain</option>
                                        <option value="Japan">Japan</option>
                                        <option value="China">China</option>
                                        <option value="India">India</option>
                                        <option value="Brazil">Brazil</option>
                                        <option value="Mexico">Mexico</option>
                                        <option value="Russia">Russia</option>
                                        <option value="South Africa">South Africa</option>
                                        <option value="Argentina">Argentina</option>
                                        <option value="Netherlands">Netherlands</option>
                                        <option value="Sweden">Sweden</option>
                                        <option value="Switzerland">Switzerland</option>
                                        <option value="Norway">Norway</option>
                                        <!-- Add more country options as needed -->
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="mb-1">
                            <div class="row">
                                <div class="col-12">
                                <select name="multiSelect" id="multiSelect" multiple>
                                    <option value="1">Software Development</option>
                                    <option value="2">Quality Assurance</option>
                                    <option value="3">Database Management</option>
                                    <option value="4">System Architecture</option>
                                    <option value="5">UI/UX Design</option>
                                    <option value="6">Project Management</option>
                                    <option value="7">Agile Methodology</option>
                                    <option value="8">Requirements Analysis</option>
                                    <option value="9">Software Testing</option>
                                    <option value="10">DevOps</option>
                                </select>
                                </div>
                            </div>
                        </div>



                        <!-- Rate and Pay rate -->
                        <div class="mb-1">
                            <div class="row">
                                <div class="col-6">
                                    <label for="input-rate" class="form-label">Rate (1-10)</label>
                                    <input name="rate" type="number" id="input-rate" class="form-control" min="1" max="10">
                                </div>
                                <div class="col-6">
                                    <label for="pay-rate" class="form-label">Pay rate</label>
                                    <input name="pay-rate" type="number" id="pay-rate" class="form-control">
                                </div>
                            </div>
                        </div>

                        <!-- Slogan -->
                        <div class="mb-1">
                            <div class="row">
                                <div class="col-12">
                                    <label for="description" class="form-label">Description</label>
                                    <textarea id="description" name="description" class="form-control" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Documents tab -->
                    <div class="tab-pane fade" id="documents" role="tabpanel" aria-labelledby="documents-tab">
                        <!-- Document details -->
                        <div class="mb-1">
                            <!-- Document name -->
                            <div class="mb-1 pt-1">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="input-group">
                                            <input name="logo" type="file" id="input-logo" class="form-control">
                                            <button id="add-button" class="btn btn-primary" type="button">
                                                <i class="bi bi-plus-circle-fill"></i> Add
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Document table -->
                            <table id="document-table-body" class="table">
                                <thead>
                                <tr>
                                    <th>Document Name</th>
                                    <th>Type</th>
                                    <th>Date</th>
                                </tr>
                                </thead>
                                <tbody  >
                                <!-- Add more rows as needed -->
                                </tbody>
                            </table>

                        </div>
                        <!-- Other document details -->
                        <!-- Add your code for document-related inputs here -->
                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Annuler</button>
                <button id="btn-enregistrer-societe" type="submit" class="btn btn-primary">Enregistrer</button>
            </div>
        </form><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>