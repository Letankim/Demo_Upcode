<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h2 class="text-center">${classI != null ? "Edit Class" : "New Class"}</h2>
                </div>
                <div class="card-body">
                    <form action="ClassController?action=${classI != null ? 'update' : 'insert'}" method="post" class="form-horizontal">
                        <input type="hidden" name="classId" value="${classI != null ? classI.classId : ''}" />

                        <!-- Class Name -->
                        <div class="form-group mb-4">
                            <label for="className" class="form-label">Class Name:</label>
                            <input type="text" class="form-control" name="className" value="${classI != null ? classI.className : ''}" required>
                        </div>

                        <!-- Teacher Dropdown -->
                        <div class="form-group mb-4">
                            <label for="teacherId" class="form-label">Teacher:</label>
                            <select class="form-control" name="teacherId" required>
                                <c:forEach var="teacher" items="${listTeachers}">
                                    <option value="${teacher.userId}" ${classI != null && classI.teacherId == teacher.userId ? 'selected' : ''}>${teacher.username}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Buttons -->
                        <div class="form-group text-center mt-4">
                            <button type="submit" class="btn btn-success">${classI != null ? "Update" : "Create"}</button>
                            <a href="ClassController?action=list" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
