<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Bookshop - Help Center</title>
    <link rel="stylesheet" href="styles/help.css">
</head>
<body>
    <div class="help-container">
        <!-- Header -->
        <header class="help-header">
            <div class="header-content">
                <div class="header-left">
                    <div class="logo-container">
                        <div class="logo-icon">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/>
                                <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/>
                            </svg>
                        </div>
                        <div class="logo-text">
                            <h1>Pahana Bookshop</h1>
                            <p>Help Center</p>
                        </div>
                    </div>
                </div>

                <a class="close-btn" href="dashboard.jsp">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="18" y1="6" x2="6" y2="18"></line>
                        <line x1="6" y1="6" x2="18" y2="18"></line>
                    </svg>
                </a>
            </div>
        </header>

        <div class="help-content">
            <!-- Welcome Section -->
            <div class="welcome-section">
                <div class="welcome-content">
                    <div class="welcome-text">
                        <h2>How can we help you today?</h2>
                        <p>Find answers, tutorials, and support for your bookshop management needs.</p>
                    </div>
                    <div class="welcome-icon">
                        <svg width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="12" cy="12" r="10"/>
                            <path d="M9.09 9a3 3 0 0 1 5.83 1c0 2-3 3-3 3"/>
                            <line x1="12" y1="17" x2="12.01" y2="17"/>
                        </svg>
                    </div>
                </div>
            </div>

            <div class="main-grid">
                <!-- Categories Sidebar -->
                <div class="categories-sidebar">
                    <div class="sidebar-card">
                        <h3>Categories</h3>
                        <nav class="category-nav">
                            <a href="#" class="category-item active" data-category="getting-started" onclick="showCategory('getting-started', this)">
                                <div class="category-icon category-icon-blue">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/>
                                        <path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/>
                                    </svg>
                                </div>
                                <span>Getting Started</span>
                            </a>
                            <a href="#" class="category-item" data-category="user-management" onclick="showCategory('user-management', this)">
                                <div class="category-icon category-icon-emerald">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                                        <circle cx="9" cy="7" r="4"/>
                                        <path d="M22 21v-2a4 4 0 0 0-3-3.87"/>
                                        <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                                    </svg>
                                </div>
                                <span>User Management</span>
                            </a>
                            <a href="#" class="category-item" data-category="pos-billing" onclick="showCategory('pos-billing', this)">
                                <div class="category-icon category-icon-purple">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <rect x="1" y="3" width="15" height="13"/>
                                        <path d="M16 8h4l-2-3h-2v3z"/>
                                        <circle cx="5.5" cy="18.5" r="2.5"/>
                                        <circle cx="18.5" cy="18.5" r="2.5"/>
                                    </svg>
                                </div>
                                <span>POS & Billing</span>
                            </a>
                            <a href="#" class="category-item" data-category="inventory" onclick="showCategory('inventory', this)">
                                <div class="category-icon category-icon-amber">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/>
                                        <rect x="7" y="7" width="3" height="9"/>
                                        <rect x="14" y="7" width="3" height="5"/>
                                    </svg>
                                </div>
                                <span>Inventory</span>
                            </a>
                            <a href="#" class="category-item" data-category="customers" onclick="showCategory('customers', this)">
                                <div class="category-icon category-icon-blue">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                                        <circle cx="8.5" cy="7" r="4"/>
                                        <path d="M20 8v6"/>
                                        <path d="M23 11l-3-3 3-3"/>
                                    </svg>
                                </div>
                                <span>Customer Management</span>
                            </a>
                            <a href="#" class="category-item" data-category="settings" onclick="showCategory('settings', this)">
                                <div class="category-icon category-icon-emerald">
                                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <circle cx="12" cy="12" r="3"/>
                                        <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1 1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/>
                                    </svg>
                                </div>
                                <span>System Settings</span>
                            </a>
                        </nav>
                    </div>
                </div>

                <!-- Main Content -->
                <div class="main-content">
                    <!-- Help Articles -->
                    <div class="content-card">
                        <h3 id="categoryTitle">Getting Started Guide</h3>

                        <div id="helpContent" class="help-articles">
                            <!-- Getting Started Content -->
                            <div class="category-content" id="getting-started">
                                <div class="article-item">
                                    <h4>Welcome to Pahana Bookshop</h4>
                                    <p>Your comprehensive bookstore management system designed for efficiency and ease of use. Get started by exploring the dashboard and familiarizing yourself with the main features.</p>
                                </div>
                                <div class="article-item">
                                    <h4>Dashboard Overview</h4>
                                    <p>View real-time sales data, user activity, product inventory, and system status from your main dashboard. The cards show key metrics at a glance.</p>
                                </div>
                                <div class="article-item">
                                    <h4>Navigation Guide</h4>
                                    <p>Use the sidebar to access Users, Customers, Products, and Settings. The header provides quick access to POS and analytics features.</p>
                                </div>
                            </div>

                            <!-- User Management Content -->
                            <div class="category-content" id="user-management" style="display: none;">
                                <div class="article-item">
                                    <h4>Managing Users</h4>
                                    <p>Add, edit, and remove system users. Assign roles like Admin, Cashier, or Manager to control access permissions and system capabilities.</p>
                                </div>
                                <div class="article-item">
                                    <h4>Role-Based Access</h4>
                                    <p>Admins have full system access, Cashiers can process sales and manage customers, Managers can view reports and analytics.</p>
                                </div>
                                <div class="article-item">
                                    <h4>User Activity Tracking</h4>
                                    <p>Monitor user login times, actions performed, and current session status from the dashboard user logs section.</p>
                                </div>
                            </div>

                            <!-- POS & Billing Content -->
                            <div class="category-content" id="pos-billing" style="display: none;">
                                <div class="article-item">
                                    <h4>Creating Sales</h4>
                                    <p>Use the POS system to scan barcodes, add products manually, apply discounts, and process payments efficiently.</p>
                                </div>
                                <div class="article-item">
                                    <h4>Payment Processing</h4>
                                    <p>Accept cash, card, and digital payments. Generate receipts automatically and track all transactions in the system.</p>
                                </div>
                                <div class="article-item">
                                    <h4>Bill Management</h4>
                                    <p>Print receipts, email invoices, and maintain comprehensive sales records for accounting and audit purposes.</p>
                                </div>
                            </div>

                            <!-- Inventory Content -->
                            <div class="category-content" id="inventory" style="display: none;">
                                <div class="article-item">
                                    <h4>Product Management</h4>
                                    <p>Add new books, update prices, manage stock levels, and organize products by categories for better inventory control.</p>
                                </div>
                                <div class="article-item">
                                    <h4>Stock Tracking</h4>
                                    <p>Monitor inventory levels in real-time, set low-stock alerts, and generate restocking reports to maintain optimal inventory.</p>
                                </div>
                                <div class="article-item">
                                    <h4>Barcode System</h4>
                                    <p>Generate and print barcodes for products to streamline the checkout process and improve inventory accuracy.</p>
                                </div>
                            </div>

                            <!-- Customer Management Content -->
                            <div class="category-content" id="customers" style="display: none;">
                                <div class="article-item">
                                    <h4>Customer Database</h4>
                                    <p>Maintain detailed customer records including contact information, purchase history, and reading preferences.</p>
                                </div>
                                <div class="article-item">
                                    <h4>Loyalty Programs</h4>
                                    <p>Set up customer loyalty points, discounts, and special offers to increase customer retention and satisfaction.</p>
                                </div>
                                <div class="article-item">
                                    <h4>Customer Analytics</h4>
                                    <p>Track customer purchasing patterns and generate detailed reports for marketing insights and business growth.</p>
                                </div>
                            </div>

                            <!-- Settings Content -->
                            <div class="category-content" id="settings" style="display: none;">
                                <div class="article-item">
                                    <h4>System Configuration</h4>
                                    <p>Configure store details, tax rates, payment methods, and system preferences to match your business requirements.</p>
                                </div>
                                <div class="article-item">
                                    <h4>Backup & Security</h4>
                                    <p>Set up automated backups, manage security settings, and monitor system health to ensure data protection.</p>
                                </div>
                                <div class="article-item">
                                    <h4>Reports & Analytics</h4>
                                    <p>Generate comprehensive sales reports, inventory reports, and performance analytics for business insights.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- FAQ Section -->
                    <div class="content-card">
                        <h3>Frequently Asked Questions</h3>

                        <div class="faq-container">
                            <div class="faq-item">
                                <button class="faq-question" onclick="toggleFaq(this)">
                                    <span>How do I reset my password?</span>
                                    <svg class="faq-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </button>
                                <div class="faq-answer">
                                    <p>Contact your system administrator or use the "Forgot Password" link on the login page to reset your password securely.</p>
                                </div>
                            </div>

                            <div class="faq-item">
                                <button class="faq-question" onclick="toggleFaq(this)">
                                    <span>How do I add new products to inventory?</span>
                                    <svg class="faq-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </button>
                                <div class="faq-answer">
                                    <p>Navigate to Products → Add New Product. Fill in the book details, set pricing, upload cover images, and assign categories.</p>
                                </div>
                            </div>

                            <div class="faq-item">
                                <button class="faq-question" onclick="toggleFaq(this)">
                                    <span>How do I process returns?</span>
                                    <svg class="faq-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </button>
                                <div class="faq-answer">
                                    <p>In the POS system, select "Returns" and scan the original receipt or search by transaction ID to process the return.</p>
                                </div>
                            </div>

                            <div class="faq-item">
                                <button class="faq-question" onclick="toggleFaq(this)">
                                    <span>How do I generate sales reports?</span>
                                    <svg class="faq-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </button>
                                <div class="faq-answer">
                                    <p>Go to Dashboard → Analytics, select your date range and report type, then click "Generate Report" to download or print.</p>
                                </div>
                            </div>

                            <div class="faq-item">
                                <button class="faq-question" onclick="toggleFaq(this)">
                                    <span>How often is data backed up?</span>
                                    <svg class="faq-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="6 9 12 15 18 9"></polyline>
                                    </svg>
                                </button>
                                <div class="faq-answer">
                                    <p>The system automatically backs up data daily at 2 AM. You can also manually create backups from Settings → Backup.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Support Sidebar -->
                <div class="support-sidebar">
                    <!-- Support Channels -->
                    <div class="sidebar-card">
                        <h3>Contact Support</h3>

                        <div class="support-channels">
                            <div class="support-item">
                                <div class="support-icon support-icon-blue">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/>
                                        <polyline points="22,6 12,13 2,6"/>
                                    </svg>
                                </div>
                                <div class="support-content">
                                    <h4>Email Support</h4>
                                    <p>Get help via email within 24 hours</p>
                                    <span class="support-contact">support@pahana.com</span>
                                </div>
                            </div>

                            <div class="support-item">
                                <div class="support-icon support-icon-emerald">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/>
                                    </svg>
                                </div>
                                <div class="support-content">
                                    <h4>Phone Support</h4>
                                    <p>Speak with our team during business hours</p>
                                    <span class="support-contact">+94 11 234 5678</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Category switching
        function showCategory(categoryId, element) {
            // Hide all category content
            const allContent = document.querySelectorAll('.category-content');
            allContent.forEach(content => content.style.display = 'none');

            // Show selected category content
            document.getElementById(categoryId).style.display = 'block';

            // Update active state
            const allItems = document.querySelectorAll('.category-item');
            allItems.forEach(item => item.classList.remove('active'));
            element.classList.add('active');

            // Update title
            const titles = {
                'getting-started': 'Getting Started Guide',
                'user-management': 'User Management Guide',
                'pos-billing': 'POS & Billing Guide',
                'inventory': 'Inventory Management Guide',
                'customers': 'Customer Management Guide',
                'settings': 'System Settings Guide'
            };
            document.getElementById('categoryTitle').textContent = titles[categoryId];
        }

        // FAQ toggle
        function toggleFaq(button) {
            const faqItem = button.parentElement;
            const answer = faqItem.querySelector('.faq-answer');
            const icon = button.querySelector('.faq-icon');

            const isOpen = faqItem.classList.contains('active');

            // Close all other FAQs
            document.querySelectorAll('.faq-item').forEach(item => {
                item.classList.remove('active');
                item.querySelector('.faq-answer').style.maxHeight = '0';
                item.querySelector('.faq-icon').style.transform = 'rotate(0deg)';
            });

            // Toggle current FAQ
            if (!isOpen) {
                faqItem.classList.add('active');
                answer.style.maxHeight = answer.scrollHeight + 'px';
                icon.style.transform = 'rotate(180deg)';
            }
        }

        // Search functionality
        function filterContent() {
            const searchTerm = document.getElementById('searchInput').value.toLowerCase();
            const articles = document.querySelectorAll('.article-item');

            articles.forEach(article => {
                const title = article.querySelector('h4').textContent.toLowerCase();
                const content = article.querySelector('p').textContent.toLowerCase();

                if (title.includes(searchTerm) || content.includes(searchTerm)) {
                    article.style.display = 'block';
                } else {
                    article.style.display = searchTerm === '' ? 'block' : 'none';
                }
            });
        }

        // Prevent default link behavior
        document.addEventListener('DOMContentLoaded', function() {
            const categoryLinks = document.querySelectorAll('.category-item');
            categoryLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                });
            });
        });
    </script>
</body>
</html>