<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Membership Purchase</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Razorpay Checkout Script -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        .membership-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin: 10px 0;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .membership-card:hover {
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
        }
        .btn-buy {
            width: 100%;
            font-weight: bold;
            padding: 10px;
        }
        .header-text {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        .price {
            font-size: 18px;
            font-weight: bold;
            margin-top: 15px;
        }
        .active-membership {
            background-color: #e7f0ff;
            border: 1px solid #b2d3f0;
            border-radius: 8px;
            padding: 15px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%@ include file="userSidebar.jsp" %>
    <div class="container mt-7" style="margin-top: 5rem;">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="text-center mb-4">
                    <h1 class="header-text">Choose Your Membership</h1>
                    <p>Select a membership plan that suits your needs and enjoy exclusive benefits.</p>
                </div>

                <%
                String membershipType = (String) request.getAttribute("membershipType");
                Long userId = (Long) request.getAttribute("userId");
                if (membershipType != null && !membershipType.equals("NONE")) {
                %>
                <div class="active-membership">
                    <h3>Your Active Membership</h3>
                    <p><strong>Membership Type:</strong> <%= membershipType %></p>
                    <p><strong>Price:</strong>
                        <%
                        String price = "";
                        if ("GOLD".equals(membershipType)) {
                            price = "₹800 per month";
                        } else if ("PLATINUM".equals(membershipType)) {
                            price = "₹400 per month";
                        }
                        %>
                        <%= price %>
                    </p>
                </div>
                <%
                }
                %>

                <div class="membership-card bg-light">
                    <h2 class="text-center text-warning">Gold Membership</h2>
                    <hr>
                    <ul>
                        <li>40% discount on selected seats.</li>
                        <li>Exclusive access to Gold seats.</li>
                        <li>Priority customer support.</li>
                        <li>Valet Parking.</li>
                        <li>20% discount on all beverages and complimentary beverages.</li>
                    </ul>
                    <div class="price text-center text-warning">Price: ₹800 per month</div>
                    <div class="text-center mt-4">
                        <button id="buyGoldMembership" class="btn btn-warning btn-buy"  data-user-id="<%= userId %>" data-membership-type="GOLD">Buy Gold Membership</button>
                    </div>
                </div>

                <div class="membership-card bg-light mt-4">
                    <h2 class="text-center text-primary">Platinum Membership</h2>
                    <hr>
                    <ul>
                        <li>20% discount on all seats.</li>
                        <li>Exclusive access to Platinum seats.</li>
                        <li>Dedicated customer support line.</li>
                        <li>Complimentary snacks and drinks.</li>
                    </ul>
                    <div class="price text-center text-primary">Price: ₹400 per month</div>
                    <div class="text-center mt-4">
                        <button id="buyPlatinumMembership" class="btn btn-primary btn-buy"  data-user-id="<%= userId %>" data-membership-type="PLATINUM">Buy Platinum Membership</button>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div id="loader" style="display:none;">Loading...</div>

    <script>
        document.getElementById('buyGoldMembership').addEventListener('click', function () {
            var userId = this.getAttribute('data-user-id');
            initiateRazorpay(userId, 'GOLD', 800, 1000000);
        });

        document.getElementById('buyPlatinumMembership').addEventListener('click', function () {
            var userId = this.getAttribute('data-user-id');
            initiateRazorpay(userId, 'PLATINUM', 400, 1000000);
        });

        function initiateRazorpay(userId, membershipType, amount, what) {
            var options = {
                "key": "rzp_test_RYaOC10U6IjI9N", 
                "amount": amount * 100, 
                "currency": "INR",
                "name": "Membership Purchase",
                "description": "Confirm your membership purchase",
                "handler": function (response) {
                    document.getElementById('loader').style.display = 'flex';
                    var confirmUrl = "http://localhost:3080/updateMembership/"+userId+"/"+membershipType;
                    console.log(confirmUrl)
                    
                    fetch(confirmUrl, {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    })
                    .then(response => response.json())
                    .then(data => {
                        console.log(data);
                        window.location.href = `/user/membership`;
                    })
                    .catch(error => console.error('Error:', error));
                },
                "prefill": {
                    "name": "User Name",
                    "email": "user@example.com",
                    "contact": "9999999999"
                },
                "notes": {
                    "address": "Movie Address"
                },
                "theme": {
                    "color": "#3399cc"
                }
            };
            var rzp1 = new Razorpay(options);
            rzp1.open();
        }
    </script>

    <!-- Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
