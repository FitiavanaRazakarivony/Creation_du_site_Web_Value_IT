<%@page import="table.nosmetier"%>
<%@page import="table.sexe"%>
<%@ page import="table.employeur" %>
<%@ page import="table.demandeurExt" %>
<%@page import="table.admin"%>
<%@page import="table.demande_accExt"%>
<%@page import="table.demande_accInt"%>
<%@page import="table.demande_refEx"%>
<%@page import="table.demande_refInt"%>
<%@page import="table.demandeurInt"%>
<%@ page import="Connexion.Connexion" %>
<%@ page import = "java.sql.*" %>

<%
    String email_admin= (String) session.getAttribute("email");
    Connection con = Connexion.connect();
    ResultSet V_res = admin.afficherAdmin(email_admin, con);
    ResultSet V_res1 = admin.afficherAdmin(email_admin, con);

    
    ResultSet AllSex = sexe.getAllSex(con); 
    ResultSet resann = nosmetier.getnosMetier(con); 
    ResultSet AllEmpl = demandeurExt.getIdDemandeurExterne(request.getParameter("id_eurExt"),con);
    //compte demandeur interne   
    ResultSet getcompteDemIn= demandeurInt.getCompDemIn(con);   

    //compte demandeur externe
    ResultSet getcompteDemEx= demandeurExt.getCompDemEx(con); 
    
    //compte demandeur accepeter apres la test externe
    ResultSet getcompteAccEx= demande_accExt.getDemandeAcc(con);   
        
    //compte demandeur accepeter apres la test interne
    ResultSet getcompteAccInt= demande_accInt.getDemandeAcc(con); 
            
    //compte demandeur supprimet Externe
    ResultSet getcompteSuppEx= demande_refEx.getDemandeSuppr(con); 
              
    //compte demandeur supprimet interne
    ResultSet getcompteSuppIn= demande_refInt.getDemandeSuppr(con); 

%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Value-IT - demaneur Externe</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
                 
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="css/responsive.css" />
    <!-- message css -->    	
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
   </head>
   <style>
      .btn {
         display: flex;
         justify-content: center;
         column-gap: 2rem;
       }
   </style>
 
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
            <nav id="sidebar">
               <div class="sidebar_blog_1">
                  <div class="sidebar-header">
                     <div class="logo_section">
                        <a href="../../index.jsp">
                        </a>
                     </div>
                  </div>
                  <div class="sidebar_user_info">
                     <div class="icon_setting"></div>
                     <div class="user_profle_side">
                        <% while (V_res.next()) { %> 
                           <div class="user_img">
                              <a href="../../index.jsp">
                              <img class="img-responsive" src="../../image/<% out.println(V_res.getString("image_admin")); %>" alt="image" />
                              </a>
                              </div>
                              <div class="user_info">
                                 <h6> <% out.println(V_res.getString("type_admin")); %></h6>
                                 <p><span class="online_animation"></span>Online</p>
                              </div>
                           </div>
                           <%}%>
                  </div>
               </div>
               <div class="sidebar_blog_2">
                  <h4>General</h4>
                   <ul class="list-unstyled components">
                     <li><a href="dashboard.jsp"><i class="fa fa-dashboard yellow_color"></i> <span>Dashboard</span></a></li>

                     <li><a href="Les travailleurs.jsp"><i class="fa fa-laptop orange_color"></i> <span>Les travailleurs</span></a></li>
                     <li>
                        <a href="#element" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-cart-plus purple_color2"></i> <span>Ajouts elements</span></a>
                        <ul class="collapse list-unstyled" id="element">
                           <li><a href="Publication.jsp">> <span>Publication</span></a></li>
                           <li><a href="les Chefs.jsp">> <span>Chef</span></a></li>
                           <li><a href="annonce.jsp">> <span>annonce</span></a></li>
                           <li><a href="Travailleur.jsp">> <span>Travailleur</span></a></li>
                        </ul>
                     </li> 

                     <li class="active">
                        <a href="#additional_page" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle"><i class="fa fa-briefcase yellow_color"></i> <span> Liste des demandes</span></a>
                        <ul class="collapse list-unstyled" id="additional_page">
 
                            <% while (getcompteDemEx.next()) {  %> 
                            <li>
                                <a href="table demandeur externe.jsp">> <span>Liste demandeurs externes </span> <a href="../#"><span class="badge"><% out.println(getcompteDemEx.getString("compteE")); %></span></a>
                            </li>
                            <% } %> 
                            <% while (getcompteDemIn.next()) { %>
                                <li>
                                    <a href="table demandeur interne.jsp">> <span>Liste demandeurs internes </span><span class="badge"><% out.print(getcompteDemIn.getString("compteI")); %></span> </a>
                                </li>
                            <% } %>
                                                       
                        </ul>
                     </li>
                     
                     
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img style="width: 33px;" class="img-responsive rounded-circle" src="../../images/agreement.png" alt="#" />Demandeur en teste
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin" aria-labelledby="navbarDarkDropdownMenuLink">
                        <li>
                            <a href="table teste du demandeur externe.jsp">>> <span> Les externes</span></a>
                        </li>
                        <li>
                            <a href="table teste du demandeur interne.jsp">>> <span> Les internes</span></a>
                        </li>
                      </ul>
                    </li>
                     
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img style="width: 33px;" class="img-responsive rounded-circle" src="../../images/agreement.png" alt="#" />Demandeur accepter
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin"
                          aria-labelledby="navbarDarkDropdownMenuLink">
                        <% while (getcompteAccEx.next()) {  %> 
                        <li>
                            <a href="table demandeur externe accepter.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les externes </span> <span class="badge"><% out.println(getcompteAccEx.getString("compteDext")); %></span></a>
                        </li>
                        <% }  %>  
                        <% while (getcompteAccInt.next()) {  %> 
                        <li>
                           <a href="table demandeur interne accepter.jsp">
                           <i class="fa fa-table blue2_color"></i> >>  <span>  Les internes </span> <span class="badge"><% out.println(getcompteAccInt.getString("compteDint")); %></span></a>
                        </li>
                        <% }  %>  
                      </ul>
                    </li>
                    
                    <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          <img style="width: 27px;" class="img-responsive rounded-circle" src="../../images/delete-folder.png" alt="#" />Demandeur supprimer
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark bg-admin"
                          aria-labelledby="navbarDarkDropdownMenuLink">
                        <li>
                            <a href="table demandeur externe refuser.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les externes </span></a>
                        </li>
                        <li>
                            <a href="table demandeur interne refuser.jsp">
                            <i class="fa fa-table blue2_color"></i> >>  <span>  Les internes </span></a>
                        </li>
                      </ul>
                    </li>
                    
                    <li>
                        <a href="contact.jsp">
                        <i class="fa fa-phone red_color"></i> <span>Contact</span></a>
                    </li>
                    
                  </ul>
               </div>
            </nav>
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
               <div class="topbar">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <div class="full">
                           <button type="button" id="sidebarCollapse" class="sidebar_toggle"><i class="fa fa-bars"></i></button>
                           <div class="logo_section">
                              <a href="index.jsp"></a>
                           </div>
                           <div class="right_topbar">
                              <div class="icon_info">
                                 
                                 <ul class="user_profile_dd">
                                    <li>
                                       <% while (V_res1.next()) { %>
                                          <a class="dropdown-toggle" data-toggle="dropdown"><img class="img-responsive rounded-circle" src="../../image/<% out.println(V_res1.getString("image_admin")); %>" alt="#" />
                                          <span class="name_user"><% out.println(V_res1.getString("type_admin")); %></span></a>
                                             <%}%>                                   
                                          <div class="dropdown-menu">
                                          
                                          <% if (email_admin != null){ %>
                                             <form action="../../DeconServlet" method="GET">
                                                <a class="dropdown-item" href="#">
                                                   <button type="submit" class="btn btn-danger">
                                                      <span>Deconnexion</span> <i class="fa fa-sign-out"></i>
                                                   </button>
                                                </a>
                                             </form>
                                       <% } %> 
                                    </li>
                                 </ul>
                              </div>
                           </div>
                        </div>
                  </nav>
               </div>
               <!-- end topbar -->
               <!-- dashboard inner -->
                <div class="midde_cont">
                     <div class="container-fluid">
                        <div class="row column_title">
                           <div class="col-md-12">
                              <div class="page_title">
                                 <h2>Voir le demandeur externe</h2>
                              </div>
                           </div>
                        </div>
                        <div class="col-md-12">
                           <div class="dash_blog">
                              <div class="dash_blog_inner">
                                    <div class="dash_head">
                                       <h3><span><i class="fa fa-edit"></i> Demandeur externe</span></h3>
                                    </div>
                                 
                                    <div class="msg_list_main">
                                    <div class="col-md-12">
                                       <div class="card-body">
                                          <%-- example --%>
                                          
                                          <% while (AllEmpl.next()) { %>
                                          
                                            <form class="row g-3 needs-validation" novalidate>
                                                <input type="text" class="form-control" id="validationCustom01" name="id" value="<% out.println(AllEmpl.getString("id_eurExt")); %>" style="display: none;" required>
                                                <div class="col-md-4">
                                                   <label for="validationCustomUsername" class="form-label">Date de la demande</label>
                                                   <div class="input-group has-validation">
                                                      <input type="text" class="form-control" id="validationCustomUsername" name="" aria-describedby="inputGroupPrepend" value="<% out.println(AllEmpl.getString("date_demEx")); %>" required>
                                                   </div>
                                                </div>

                                                <div class="col-lg-12">
                                                   <div class="col-sm-4 col-md-3 margin_bottom_30">
                                                      <div class="column">
                                                        <label for="validationCustom01" class="form-label">Voici le CV : </label>
                                                         <a data-fancybox="gallery" href="../../cv externe/<% out.println(AllEmpl.getString("CV_demExt")); %>">
                                                         <img class="img-responsive" src="../../cv externe/<% out.println(AllEmpl.getString("CV_demExt")); %>" alt="#" /></a>
                                                      </div>
                                                   </div>
                                                </div>
                                              
                                                <div class="col-md-6">
                                                    <label for="validationCustom01" class="form-label">Nom</label>
                                                    <input type="text" class="form-control" id="validationCustom01" name="nom_empl" value="<% out.println(AllEmpl.getString("nom_eurExt")); %>" required>
                                                    <div class="valid-feedback">
                                                        OK !
                                                    </div>
                                                    <div class="invalid-feedback">
                                                        Vérifier le nom.
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                   <label for="validationCustom02" class="form-label">Prenom</label>
                                                   <input type="text" class="form-control" id="validationCustom02" name="prenom_empl"  value="<% out.println(AllEmpl.getString("prenom_eurExt")); %>" required>
                                                   <div class="valid-feedback">
                                                        OK !
                                                   </div>
                                                   <div class="invalid-feedback">
                                                        Vérifier le prenom.
                                                   </div>
                                                </div>
                                                <div class="col-md-4">
                                                   <label for="validationCustom02" class="form-label">tel</label>
                                                   <input type="text" class="form-control" id="validationCustom02" name="tel_empl" value="<% out.println(AllEmpl.getString("tel_eurExt")); %>" required>
                                                   <div class="valid-feedback">
                                                      OK !
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Vérifier le tel.
                                                   </div>
                                                </div>
                                                
                                                <div class="col-md-4">
                                                   <label for="validationCustomUsername" class="form-label">email</label>
                                                   <div class="input-group has-validation">
                                                      <span class="input-group-text" id="inputGroupPrepend">@</span>
                                                      <input type="mail" class="form-control" id="validationCustomUsername" name="email_empl" aria-describedby="inputGroupPrepend" value="<% out.println(AllEmpl.getString("email_eurExt")); %>" required>
                                                      <div class="valid-feedback">
                                                      OK !
                                                      </div>
                                                      <div class="invalid-feedback">
                                                      Vérifier l' email.
                                                   </div>
                                                   </div>
                                                </div>
                                                <div class="col-md-4">
                                                   <label for="validationCustom03" class="form-label">adresse</label>
                                                   <input type="text" class="form-control" id="validationCustom03"   name="adress_empl"  value="<% out.println(AllEmpl.getString("adresse_eurExt")); %>" required>
                                                   <div class="valid-feedback">
                                                      OK !
                                                   </div>
                                                   <div class="invalid-feedback">
                                                   Vérifier l' adresse.
                                                   </div>
                                                </div>
                                                <div class="col-md-4">
                                                   <label  for="validationCustom04" class="form-label">sexe : <% out.println(AllEmpl.getString("sexe")); %></label>
                                                   <select name="id_sexe" class="form-select col-md-6" id="validationCustom04" style="margin-top: 1.3rem;height: 3rem;" aria-label="Default select example" required>
                                                      <option selected disabled value="<% out.println(AllEmpl.getString("sexe")); %>">Choisir...</option>
                                                      <option>
                                                      <% while (AllSex.next()) { %>
                                                         <option value="<% out.println(AllSex.getString("id_sexe")); %>">
                                                            <% out.println(AllSex.getString("sexe")); %>
                                                         </option>
                                                      <% }%>
                                                      </option>
                                                   </select>
                                                   <div class="valid-feedback">
                                                   OK !
                                                   </div>
                                                   <div class="invalid-feedback">
                                                   Vérifier le champ de sexe.
                                                   </div>
                                                </div>
                                                <div class="col-md-6">
                                                   <label  for="validationCustom04" class="form-label">metier : <% out.println(AllEmpl.getString("nom_nosMet")); %></label>
                                                   <select name="id_nosMet" class="form-select col-md-6" id="validationCustom04" style="margin-top: 1.3rem;height: 3rem;" aria-label="Default select example"  required>
                                                      <option selected disabled value="<% out.println(AllEmpl.getString("nom_nosMet")); %>">Choisir...</option>
                                                      <option>
                                                         <% while (resann.next()) { %>
                                                            <option value="<% out.println(resann.getString("id_nosMet")); %>">
                                                                  <% out.println(resann.getString("nom_nosMet")); %>
                                                            </option>
                                                         <% }%>
                                                      </option>
                                                   </select>
                                                   
                                                </div>
                                                
                                                <div class="col-md-12 mt-4">
                                                   <label for="validationCustom03" class="form-label">Annonce</label>
                                                   <textarea type="text" class="form-control" id="validationCustom03"   name="adress_empl"  value="<% out.println(AllEmpl.getString("annonce")); %>" required><% out.println(AllEmpl.getString("annonce")); %></textarea>
                                                   <div class="valid-feedback">
                                                      OK !
                                                   </div>
                                                   <div class="invalid-feedback">
                                                   Vérifier le adresse.
                                                   </div>
                                                </div>
                                                
                                                <div class="col-md-6">
                                                   <label for="validationCustomUsername" class="form-label">Objet de la demande</label>
                                                   <div class="input-group has-validation">
                                                      <input type="text" class="form-control" id="validationCustomUsername" name="objet_demex" aria-describedby="inputGroupPrepend" value="<% out.println(AllEmpl.getString("objet_demandeI")); %>" required>
                                                   </div>
                                                </div>
                                                <div class="col-md-6">
                                                   <label for="validationCustomUsername" class="form-label">contenu de la demande </label>
                                                   <div class="input-group has-validation">
                                                      <input type="text" class="form-control" id="validationCustomUsername" name="objet_demex" aria-describedby="inputGroupPrepend" value="<% out.println(AllEmpl.getString("contenu_demEx")); %>" required>
                                                   </div>
                                                </div>
                                                <a href="#" class="btn btn-primary mt-5" onclick="history.back()">Retour</a>
                                            </form>

                                          <%}%>

                                       </div>
                                    </div>
                                    
                                 </div>
                                 
                              </div>
                           </div>
                        </div>   
                     </div>
                </div>


               <!-- end dashboard inner -->
            </div>
         </div>
      </div>
        <script src="../dashbord/bootstrap V5/js/bootstrap.bundle.min.js"></script>  
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script>
           var ps = new PerfectScrollbar('#sidebar');
        </script>
        <!-- custom js -->
        <script src="js/chart_custom_style1.js"></script>
        <script src="js/custom.js"></script>
        <script>
         // Example starter JavaScript for disabling form submissions if there are invalid fields
         (function () {
            'use strict'
         
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')
         
            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
            .forEach(function (form) {
               form.addEventListener('submit', function (event) {
                  if (!form.checkValidity()) {
                  event.preventDefault()
                  event.stopPropagation()
                  }
         
                  form.classList.add('was-validated')
               }, false)
            })
         })()
      </script>
             
        <!-- message js-->	
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>        

	<script>
            var message = "<%= request.getParameter("etat") %>";
            if (message == 1) {
              // Afficher la notification de succ�s avec Swal.fire()
              Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Your work has been saved',
                showConfirmButton: false,
                timer: 1500
              });
            } else if (message == 0) {
              // Afficher la notification d'erreur avec Swal.fire()
              Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Something went wrong!'
              });
            }
        </script>

   </body>
</html>