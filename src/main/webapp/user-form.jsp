<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h2 class="text-center">${user != null ? "Edit User" : "New User"}</h2>
                </div>
                <div class="card-body">
                    <!-- Display errors if any -->
                    <c:if test="${!empty errors}">
                        <div class="alert alert-danger">
                            <ul>
                                <c:forEach var="error" items="${errors}">
                                    <li>${error}</li>
                                </c:forEach>
                            </ul>
                        </div>
                    </c:if>

                    <form action="UserController?action=${user != null ? 'update' : 'insert'}" method="post" class="form-horizontal">
                        <input type="hidden" name="userId" value="${user != null ? user.userId : ''}" />

                        <!-- Username -->
                        <div class="form-group mb-4">
                            <label for="username" class="form-label">Username:</label>
                            <input type="text" class="form-control" name="username" value="${user != null ? user.username : ''}" required>
                        </div>

                        <!-- Password -->
                        <div class="form-group mb-4">
                            <label for="password" class="form-label">Password:</label>
                            <input type="password" class="form-control" name="password" value="${user != null ? user.password : ''}" required>
                        </div>

                        <!-- Email -->
                        <div class="form-group mb-4">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" name="email" value="${user != null ? user.email : ''}" required>
                        </div>

                        <!-- Role -->
                        <div class="form-group mb-4">
                            <label for="role" class="form-label">Role:</label>
                            <select class="form-control" name="role" required>
                                <option value="Admin" ${user != null && user.role.equals('Admin') ? 'selected' : ''}>Admin</option>
                                <option value="Manager" ${user != null && user.role.equals('Manager') ? 'selected' : ''}>Manager</option>
                                <option value="Teacher" ${user != null && user.role.equals('Teacher') ? 'selected' : ''}>Teacher</option>
                                <option value="Student" ${user != null && user.role.equals('Student') ? 'selected' : ''}>Student</option>
                            </select>
                        </div>

                        <!-- Buttons -->
                        <div class="form-group text-center mt-4">
                            <button type="submit" class="btn btn-success">${user != null ? "Update" : "Create"}</button>
                            <a href="UserController?action=list" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
