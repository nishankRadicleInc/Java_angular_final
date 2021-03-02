<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
                <title>
                    Person CRUD - GNSMK
                </title>

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
            </head>

            <body>
                <div class="container-fluid">
                    <c:if test="${empty newPerson}">
                        <form:form action="/add" method="post">
                            <div class="row">
                                <div class="col-lg-4">
                                    <input style="margin: 1%" type="text" name="name" class="form-control" placeholder="Person Name" autofocus required/>
                                </div>
                                <div class="col-lg-4">
                                    <input style="margin: 1%" type="text" name="age" class="form-control" placeholder="Person Age" required/>
                                </div>
                                <div class="col">
                                    <input style="margin: 1%" type="submit" class="btn btn-success col" value="Add Person" />
                                </div>
                            </div>
                        </form:form>
                    </c:if>

                    <c:if test="${!empty newPerson}">
                        <form:form action="/update" method="post">
                            <div class="row">
                                <div>
                                    <input type="hidden" name="id" value=${newPerson.id} />
                                </div>
                                <div class="col-lg-4">
                                    <input style="margin: 1%" type="text" name="name" class="form-control" value="${newPerson.name}" autofocus required/>
                                </div>
                                <div class="col-lg-4">
                                    <input style="margin: 1%" type="text" name="age" class="form-control" value="${newPerson.age}" required/>
                                </div>
                                <div class="col">
                                    <input style="margin: 1%" type="submit" class="btn btn-primary col" value="Update Person" />
                                </div>
                            </div>
                        </form:form>
                    </c:if>

                    <hr/>

                    <c:if test="${!empty list}">
                        <c:forEach items="${list}" var="x">
                            <div class="row">
                                <div class="col-lg-4">
                                    <p style="margin: 1%" class="form-control">${x.name}</p>
                                </div>
                                <div class="col-lg-4">
                                    <p style="margin: 1%" class="form-control">${x.age}</p>
                                </div>
                                <div class="col">
                                    <button style="margin: 1%" onclick="location.href='/edit/${x.id}';" class="btn btn-warning col">Edit</button>
                                </div>
                                <div class="col">
                                    <button style="margin: 1%" onclick="location.href='/delete/${x.id}';" class="btn btn-danger col">Delete</button>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>

                    <c:if test="${empty list}">
                        <div class="row">
                            <div class="col">
                                <p class="form-control col" style="text-align:center; color:grey">List Empty</p>
                            </div>
                        </div>
                    </c:if>

                </div>
            </body>

            </html>