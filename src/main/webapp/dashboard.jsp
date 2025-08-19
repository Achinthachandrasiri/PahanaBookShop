<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Bookshop Dashboard</title>
    <link rel="stylesheet" href="styles/dashboard.css">
</head>
<body>
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="logo-container">
                <div class="logo-icon">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M2 3h6l2 13h10l4-8H8"/>
                        <circle cx="9" cy="19" r="1"/>
                        <circle cx="20" cy="19" r="1"/>
                    </svg>
                </div>
                <div class="logo-text">
                    <h1>Pahana</h1>
                </div>
            </div>
        </div>

        <nav class="sidebar-nav">
            <a href="users" class="nav-item">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                    <circle cx="9" cy="7" r="4"/>
                    <path d="M22 21v-2a4 4 0 0 0-3-3.87"/>
                    <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                </svg>
                <span>Users</span>
            </a>
            <a href="customers" class="nav-item">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                    <circle cx="8.5" cy="7" r="4"/>
                    <path d="M20 8v6"/>
                    <path d="M23 11l-3-3 3-3"/>
                </svg>
                <span>Customers</span>
            </a>
            <a href="viewProducts" class="nav-item">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
                    <rect x="7" y="7" width="3" height="9"/>
                    <rect x="14" y="7" width="3" height="5"/>
                </svg>
                <span>Products</span>
            </a>
            <a href="#" class="nav-item">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="12" cy="12" r="3"/>
                    <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1 1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/>
                </svg>
                <span>Settings</span>
            </a>
        </nav>
    </aside>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <header class="header">
            <div class="header-left">
                <div class="header-logo">
                    <div class="header-logo-icon">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M2 3h6l2 13h10l4-8H8"/>
                            <circle cx="9" cy="19" r="1"/>
                            <circle cx="20" cy="19" r="1"/>
                        </svg>
                    </div>
                    <span>Pahana Bookshop</span>
                </div>

                <div class="header-nav">
                    <a href="#">Dashboard</a>
                    <a href="#">Analytics</a>
                    <a href="#">Orders</a>
                    <a href="#">Reports</a>
                </div>
            </div>

            <div class="header-right">
                <a href="billing.jsp" style="text-decoration: none;" class="pos-button">POS</a>
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/>
                        <line x1="3" y1="6" x2="21" y2="6"/>
                        <path d="M16 10a4 4 0 0 1-8 0"/>
                    </svg>

                </a>

                <div class="time-display">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="12" cy="12" r="10"/>
                        <polyline points="12,6 12,12 16,14"/>
                    </svg>
                    <div class="time-info">
                        <div class="current-time" id="currentTime">--:--:--</div>
                        <div class="current-date" id="currentDate">Loading...</div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Dashboard Content -->
        <main class="dashboard-main">
            <!-- Welcome Section -->
            <div class="welcome-section">
                <h2>Welcome back!</h2>
                <p>Here's what's happening with your bookshop today.</p>
            </div>

            <!-- Dashboard Cards -->
            <div class="dashboard-cards">
                <div class="card card-blue">
                    <div class="card-content">
                        <div class="card-info">
                            <p class="card-title">Total Sales</p>
                            <p class="card-value">${sessionScope.totalSalesCount}</p>
                        </div>
                        <div class="card-icon card-icon-blue">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/>
                                <polyline points="17 6 23 6 23 12"/>
                            </svg>
                        </div>
                    </div>
                    <div class="card-gradient"></div>
                </div>

                <div class="card card-emerald">
                    <div class="card-content">
                        <div class="card-info">
                            <p class="card-title">Total Amount</p>
                            <p class="card-value">LKR ${sessionScope.totalSalesAmount}</p>
                        </div>
                        <div class="card-icon card-icon-emerald">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <line x1="12" y1="1" x2="12" y2="23"/>
                                <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/>
                            </svg>
                        </div>
                    </div>
                    <div class="card-gradient"></div>
                </div>

                <div class="card card-purple">
                    <div class="card-content">
                        <div class="card-info">
                            <p class="card-title">Active Users</p>
                            <p class="card-value">${sessionScope.totalUsers}</p>
                        </div>
                        <div class="card-icon card-icon-purple">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                                <circle cx="9" cy="7" r="4"/>
                                <path d="M22 21v-2a4 4 0 0 0-3-3.87"/>
                                <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                            </svg>
                        </div>
                    </div>
                    <div class="card-gradient"></div>
                </div>

                <div class="card card-amber">
                    <div class="card-content">
                        <div class="card-info">
                            <p class="card-title">Products</p>
                            <p class="card-value">${sessionScope.totalProducts}</p>
                        </div>
                        <div class="card-icon card-icon-amber">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
                                <rect x="7" y="7" width="3" height="9"/>
                                <rect x="14" y="7" width="3" height="5"/>
                            </svg>
                        </div>
                    </div>
                    <div class="card-gradient"></div>
                </div>
            </div>

            <!-- Additional Stats -->
            <div class="stats-grid">
                <div class="stats-card">
                    <h3>User Logs</h3>
                    <div class="activity-list">
                        <div class="activity-item">
                            <span>Username</span>
                            <span class="status-badge status-online">${sessionScope.userEmail}</span>
                        </div>
                        <div class="activity-item">
                            <span>Role</span>
                            <span class="status-badge status-online"> <%= session.getAttribute("userRole") %></span>
                        </div>
                    </div>
                </div>

                <div class="stats-card">
                    <h3>System Status</h3>
                    <div class="status-list">
                        <div class="status-item">
                            <span>Server Status</span>
                            <span class="status-badge status-online">Online</span>
                        </div>
                        <div class="status-item">
                            <span>Database</span>
                            <span class="status-badge status-connected">Connected</span>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script>
        function updateTime() {
            const now = new Date();
            const timeElement = document.getElementById('currentTime');
            const dateElement = document.getElementById('currentDate');

            if (timeElement && dateElement) {
                timeElement.textContent = now.toLocaleTimeString('en-US', {
                    hour: '2-digit',
                    minute: '2-digit',
                    second: '2-digit'
                });

                dateElement.textContent = now.toLocaleDateString('en-US', {
                    weekday: 'long',
                    year: 'numeric',
                    month: 'long',
                    day: 'numeric'
                });
            }
        }

        // Update time immediately and then every second
        updateTime();
        setInterval(updateTime, 1000);

        // Add hover effects for cards
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.card');
            cards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-2px)';
                });

                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                });
            });
        });
    </script>
</body>
</html>