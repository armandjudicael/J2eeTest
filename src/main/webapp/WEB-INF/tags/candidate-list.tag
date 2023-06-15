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
                                                <span class="badge bg-success ms-1"><i class="mdi mdi-star align-middle"></i>${person.rate}</span>
                                            </h5>
                                            <p class="text-muted mb-2">${person.field}</p>
                                            <ul class="list-inline mb-0 text-muted">
                                                <li class="list-inline-item"><i class="mdi mdi-map-marker"></i> ${person.address}</li>
                                                <li class="list-inline-item"><i class="mdi mdi-wallet"></i> ${person.star} / hour</li>
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
                                                                        <a href="downloadAttachment?personId=${person.id}&filename=${attach.key}&download=true">Download</a>
                                                                        <a href="downloadAttachment?personId=${person.id}&filename=${attach.key}&download=false">View</a>
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