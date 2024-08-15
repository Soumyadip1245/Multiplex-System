<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.example.view_controller.entity.Vouchers" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Vouchers</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   
</head>
<body>
    <%@ include file="ownerSidebar.jsp" %>

    <div class="container mb-5" style="margin: 7rem;">
        <h2>Manage Vouchers</h2>

        <button type="button" class="btn btn-primary mb-3" data-toggle="modal" data-target="#voucherModal">
            Create Voucher
        </button>

        <table class="table table-bordered" id="voucherTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Type</th>
                    <th>Value(%)</th>
                    <th>Minimum Spend</th>
                    <th>Expiration Date</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Vouchers[] vouchers = (Vouchers[]) request.getAttribute("vouchers");
                    for (Vouchers voucher : vouchers) { 
                %>
                <tr>
                    <td><%= voucher.getId() %></td>
                    <td><%= voucher.getType() %></td>
                    <td><%= voucher.getValue() %></td>
                    <td><%= voucher.getMinimumSpend() %></td>
                    <td><%= voucher.getExpirationDate() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <div class="modal fade" id="voucherModal" tabindex="-1" role="dialog" aria-labelledby="voucherModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="voucherModalLabel">Create Voucher</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="voucherForm" action="/owner/add-voucher" method="post">
                        <div class="form-group">
                            <label for="type">Voucher Type</label>
                            <select class="form-control" id="type" name="type" required>
                                <option value="" disabled selected>Select Voucher Type</option>
                                <option value="FOOD_COUPON">FOOD COUPON</option>
                                <option value="PARKING_COUPON">PARKING COUPON</option>
                                <option value="MOVIE_DISCOUNT">MOVIE DISCOUNT</option>
                                <option value="SHOPPING_VOUCHER">SHOPPING VOUCHER</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="value">Value(%)</label>
                            <input type="number" class="form-control" id="value" name="value" required>
                        </div>
                        <div class="form-group">
                            <label for="minimumSpend">Minimum Spend</label>
                            <input type="number" class="form-control" id="minimumSpend" name="minimumSpend" required>
                        </div>
                        <div class="form-group">
                            <label for="expirationDate">Expiration Date</label>
                            <input type="date" class="form-control" id="expirationDate" name="expirationDate" required>
                        </div>
                        <button type="submit" class="btn btn-primary" id="submitVoucher">Create Voucher</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
