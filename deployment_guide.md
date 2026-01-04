# Deployment Guide for soloist.ai

This guide will walk you through the process of manually deploying your website to `soloist.ai`. Since `soloist.ai` is a no-code platform, you will need to copy and paste the code from this guide into the appropriate sections of the `soloist.ai` editor.

## 1. HTML Structure

Copy the following code and paste it into the main HTML section of your `soloist.ai` project.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="ZOLO-A6-9VxNUNA - AI-Powered Trading System & Device Automation Platform">
    <meta name="keywords" content="ZOLO, A6-9V, NuNa, Trading System, MetaTrader 5, Automation, Windows 11">
    <meta name="author" content="A6-9V Organization">

    <!-- Open Graph / Social Media -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://mouy-leng.github.io/ZOLO-A6-9VxNUNA-/">
    <meta property="og:title" content="ZOLO-A6-9VxNUNA - AI Trading & Automation">
    <meta property="og:description" content="Professional AI-Powered Trading System & Device Automation Platform">
    <meta property="og:image" content="assets/og-image.png">

    <!-- Twitter -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="ZOLO-A6-9VxNUNA - AI Trading & Automation">
    <meta name="twitter:description" content="Professional AI-Powered Trading System & Device Automation Platform">

    <!-- Security Headers -->
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
    <meta http-equiv="Strict-Transport-Security" content="max-age=31536000; includeSubDomains">

    <title>ZOLO-A6-9VxNUNA | AI Trading & Automation Platform</title>

    <!-- Favicon -->
    <link rel="icon" type="image/svg+xml" href="assets/favicon.svg">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600;700&family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- Styles -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Animated Background -->
    <div class="bg-grid"></div>
    <div class="bg-glow"></div>

    <!-- Navigation -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="#" class="nav-logo">
                <span class="logo-icon">⚡</span>
                <span class="logo-text">ZOLO<span class="accent">-A6-9V</span></span>
            </a>
            <div class="nav-links">
                <a href="#features" class="nav-link">Features</a>
                <a href="#systems" class="nav-link">Systems</a>
                <a href="#architecture" class="nav-link">Architecture</a>
                <a href="#docs" class="nav-link">Docs</a>
                <a href="https://github.com/Mouy-leng/ZOLO-A6-9VxNUNA-" class="nav-btn" target="_blank" rel="noopener">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                    </svg>
                    GitHub
                </a>
            </div>
            <button class="nav-toggle" aria-label="Toggle navigation">
                <span></span>
                <span></span>
                <span></span>
            </button>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="hero">
        <div class="hero-content">
            <div class="hero-badge">
                <span class="badge-dot"></span>
                <span>Version 2.0 • Production Ready</span>
            </div>
            <h1 class="hero-title">
                <span class="title-line">ZOLO-A6-9V</span>
                <span class="title-line accent">×NuNa</span>
            </h1>
            <p class="hero-subtitle">
                AI-Powered Trading System & Complete Device Automation Platform for Windows 11
            </p>
            <div class="hero-stats">
                <div class="stat">
                    <span class="stat-value">99.9%</span>
                    <span class="stat-label">Uptime</span>
                </div>
                <div class="stat">
                    <span class="stat-value">MT5</span>
                    <span class="stat-label">Integration</span>
                </div>
                <div class="stat">
                    <span class="stat-value">256-bit</span>
                    <span class="stat-label">Encryption</span>
                </div>
            </div>
            <div class="hero-actions">
                <a href="#getting-started" class="btn btn-primary">
                    <span>Get Started</span>
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path d="M5 12h14M12 5l7 7-7 7"/>
                    </svg>
                </a>
                <a href="https://github.com/Mouy-leng/ZOLO-A6-9VxNUNA-" class="btn btn-secondary" target="_blank" rel="noopener">
                    View Source
                </a>
            </div>
        </div>
        <div class="hero-visual">
            <div class="terminal">
                <div class="terminal-header">
                    <div class="terminal-dots">
                        <span class="dot red"></span>
                        <span class="dot yellow"></span>
                        <span class="dot green"></span>
                    </div>
                    <span class="terminal-title">PowerShell</span>
                </div>
                <div class="terminal-body">
                    <pre><code><span class="prompt">PS C:\></span> <span class="cmd">.\complete-device-setup.ps1</span>

<span class="output">[✓] Initializing ZOLO-A6-9VxNUNA System...</span>
<span class="output">[✓] Windows 11 Configuration Complete</span>
<span class="output">[✓] Cloud Sync Services Connected</span>
<span class="output">[✓] MetaTrader 5 Integration Active</span>
<span class="output">[✓] Security Validation Passed</span>
<span class="output">[✓] Git Repositories Synchronized</span>

<span class="success">🚀 System Ready - All Services Online</span>
<span class="prompt">PS C:\></span> <span class="cursor">_</span></code></pre>
                </div>
            </div>
        </div>
    </header>

    <!-- Features Section -->
    <section id="features" class="features">
        <div class="container">
            <div class="section-header">
                <span class="section-badge">Core Features</span>
                <h2 class="section-title">Everything You Need</h2>
                <p class="section-desc">A comprehensive suite of tools for trading and automation</p>
            </div>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5"/>
                        </svg>
                    </div>
                    <h3>AI Trading Engine</h3>
                    <p>Advanced machine learning algorithms for Forex & Gold trading on MetaTrader 5 platform</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <rect x="2" y="3" width="20" height="14" rx="2" ry="2"/>
                            <path d="M8 21h8M12 17v4"/>
                        </svg>
                    </div>
                    <h3>Windows Automation</h3>
                    <p>Complete Windows 11 setup automation with PowerShell scripts and security configurations</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                        </svg>
                    </div>
                    <h3>Enterprise Security</h3>
                    <p>Multi-layer security with token validation, credential management, and encrypted communications</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/>
                            <circle cx="9" cy="7" r="4"/>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/>
                        </svg>
                    </div>
                    <h3>Multi-Account Support</h3>
                    <p>Seamlessly manage Microsoft, Google, and GitHub accounts with unified authentication</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/>
                            <polyline points="3.27 6.96 12 12.01 20.73 6.96"/>
                            <line x1="12" y1="22.08" x2="12" y2="12"/>
                        </svg>
                    </div>
                    <h3>Cloud Synchronization</h3>
                    <p>Automatic sync with OneDrive, Google Drive, and Dropbox for seamless data backup</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">
                        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                            <circle cx="12" cy="12" r="3"/>
                            <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/>
                        </svg>
                    </div>
                    <h3>Git Integration</h3>
                    <p>Automated Git operations with multi-remote support, GitHub Desktop integration, and secure credentials</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Systems Section -->
    <section id="systems" class="systems">
        <div class="container">
            <div class="section-header">
                <span class="section-badge">Integrated Systems</span>
                <h2 class="section-title">Connected Repositories</h2>
                <p class="section-desc">A unified ecosystem of interconnected projects</p>
            </div>
            <div class="systems-grid">
                <div class="system-card primary">
                    <div class="system-status">
                        <span class="status-dot active"></span>
                        <span>Primary</span>
                    </div>
                    <h3>ZOLO-A6-9VxNUNA-</h3>
                    <p>Main trading system and device automation hub</p>
                    <a href="https://github.com/Mouy-leng/ZOLO-A6-9VxNUNA-" class="system-link" target="_blank" rel="noopener">
                        github.com/Mouy-leng/ZOLO-A6-9VxNUNA-
                    </a>
                </div>
                <div class="system-card">
                    <div class="system-status">
                        <span class="status-dot active"></span>
                        <span>Secondary</span>
                    </div>
                    <h3>my-drive-projects</h3>
                    <p>Project resources and device skeleton structure</p>
                    <a href="https://github.com/A6-9V/my-drive-projects" class="system-link" target="_blank" rel="noopener">
                        github.com/A6-9V/my-drive-projects
                    </a>
                </div>
                <div class="system-card">
                    <div class="system-status">
                        <span class="status-dot active"></span>
                        <span>Bridge</span>
                    </div>
                    <h3>I-bride_bridge3rd</h3>
                    <p>Third-party integration bridge</p>
                    <a href="https://github.com/A6-9V/I-bride_bridge3rd" class="system-link" target="_blank" rel="noopener">
                        github.com/A6-9V/I-bride_bridge3rd
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Architecture Section -->
    <section id="architecture" class="architecture">
        <div class="container">
            <div class="section-header">
                <span class="section-badge">System Design</span>
                <h2 class="section-title">Architecture Overview</h2>
                <p class="section-desc">How ZOLO-A6-9VxNUNA components work together</p>
            </div>
            <div class="arch-diagram">
                <div class="arch-layer">
                    <div class="arch-title">Presentation Layer</div>
                    <div class="arch-items">
                        <div class="arch-item">GitHub Pages</div>
                        <div class="arch-item">MetaTrader 5 UI</div>
                        <div class="arch-item">PowerShell CLI</div>
                    </div>
                </div>
                <div class="arch-connector">
                    <svg width="24" height="40" viewBox="0 0 24 40">
                        <path d="M12 0 L12 40" stroke="currentColor" stroke-width="2" stroke-dasharray="4"/>
                        <path d="M12 35 L7 30 M12 35 L17 30" stroke="currentColor" stroke-width="2"/>
                    </svg>
                </div>
                <div class="arch-layer">
                    <div class="arch-title">Application Layer</div>
                    <div class="arch-items">
                        <div class="arch-item">GenX FX Trading</div>
                        <div class="arch-item">Windows Automation</div>
                        <div class="arch-item">Security Validation</div>
                    </div>
                </div>
                <div class="arch-connector">
                    <svg width="24" height="40" viewBox="0 0 24 40">
                        <path d="M12 0 L12 40" stroke="currentColor" stroke-width="2" stroke-dasharray="4"/>
                        <path d="M12 35 L7 30 M12 35 L17 30" stroke="currentColor" stroke-width="2"/>
                    </svg>
                </div>
                <div class="arch-layer">
                    <div class="arch-title">Integration Layer</div>
                    <div class="arch-items">
                        <div class="arch-item">Git Multi-Remote</div>
                        <div class="arch-item">Cloud Sync</div>
                        <div class="arch-item">API Bridges</div>
                    </div>
                </div>
                <div class="arch-connector">
                    <svg width="24" height="40" viewBox="0 0 24 40">
                        <path d="M12 0 L12 40" stroke="currentColor" stroke-width="2" stroke-dasharray="4"/>
                        <path d="M12 35 L7 30 M12 35 L17 30" stroke="currentColor" stroke-width="2"/>
                    </svg>
                </div>
                <div class="arch-layer">
                    <div class="arch-title">Data Layer</div>
                    <div class="arch-items">
                        <div class="arch-item">OneDrive</div>
                        <div class="arch-item">Google Drive</div>
                        <div class="arch-item">GitHub Repos</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Getting Started Section -->
    <section id="getting-started" class="getting-started">
        <div class="container">
            <div class="section-header">
                <span class="section-badge">Quick Start</span>
                <h2 class="section-title">Get Started in Minutes</h2>
                <p class="section-desc">Follow these steps to set up your environment</p>
            </div>
            <div class="steps">
                <div class="step">
                    <div class="step-number">01</div>
                    <div class="step-content">
                        <h3>Clone the Repository</h3>
                        <div class="code-block">
                            <code>git clone https://github.com/Mouy-leng/ZOLO-A6-9VxNUNA-.git</code>
                            <button class="copy-btn" onclick="copyCode(this)">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="9" y="9" width="13" height="13" rx="2" ry="2"/>
                                    <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="step">
                    <div class="step-number">02</div>
                    <div class="step-content">
                        <h3>Run Setup Script</h3>
                        <div class="code-block">
                            <code>.\complete-device-setup.ps1</code>
                            <button class="copy-btn" onclick="copyCode(this)">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="9" y="9" width="13" height="13" rx="2" ry="2"/>
                                    <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="step">
                    <div class="step-number">03</div>
                    <div class="step-content">
                        <h3>Configure MetaTrader 5</h3>
                        <div class="code-block">
                            <code>.\setup-mt5-integration.ps1</code>
                            <button class="copy-btn" onclick="copyCode(this)">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="9" y="9" width="13" height="13" rx="2" ry="2"/>
                                    <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="step">
                    <div class="step-number">04</div>
                    <div class="step-content">
                        <h3>Launch Trading System</h3>
                        <div class="code-block">
                            <code>.\start-trading-system.ps1</code>
                            <button class="copy-btn" onclick="copyCode(this)">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                    <rect x="9" y="9" width="13" height="13" rx="2" ry="2"/>
                                    <path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Documentation Section -->
    <section id="docs" class="docs">
        <div class="container">
            <div class="section-header">
                <span class="section-badge">Resources</span>
                <h2 class="section-title">Documentation</h2>
                <p class="section-desc">Everything you need to know</p>
            </div>
            <div class="docs-grid">
                <a href="docs/device-skeleton.html" class="doc-card">
                    <div class="doc-icon">📁</div>
                    <h3>Device Skeleton</h3>
                    <p>Complete device structure blueprint</p>
                </a>
                <a href="docs/project-blueprints.html" class="doc-card">
                    <div class="doc-icon">📐</div>
                    <h3>Project Blueprints</h3>
                    <p>Detailed project architectures</p>
                </a>
                <a href="docs/automation-rules.html" class="doc-card">
                    <div class="doc-icon">⚙️</div>
                    <h3>Automation Rules</h3>
                    <p>Automation patterns and best practices</p>
                </a>
                <a href="docs/security.html" class="doc-card">
                    <div class="doc-icon">🔐</div>
                    <h3>Security Guide</h3>
                    <p>Security configurations and validation</p>
                </a>
                <a href="docs/mt5-integration.html" class="doc-card">
                    <div class="doc-icon">📈</div>
                    <h3>MT5 Integration</h3>
                    <p>MetaTrader 5 setup and trading</p>
                </a>
                <a href="docs/api-reference.html" class="doc-card">
                    <div class="doc-icon">📚</div>
                    <h3>API Reference</h3>
                    <p>Complete API documentation</p>
                </a>
            </div>
        </div>
    </section>

    <!-- System Info Section -->
    <section class="system-info">
        <div class="container">
            <div class="info-card">
                <h3>System Requirements</h3>
                <div class="info-grid">
                    <div class="info-item">
                        <span class="info-label">OS</span>
                        <span class="info-value">Windows 11 Home 25H2+</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Processor</span>
                        <span class="info-value">Intel i3-N305 or better</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">RAM</span>
                        <span class="info-value">8 GB minimum</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">PowerShell</span>
                        <span class="info-value">5.1 or higher</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Git</span>
                        <span class="info-value">2.40+ required</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">MetaTrader</span>
                        <span class="info-value">MT5 with EXNESS</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="footer-brand">
                    <span class="logo-icon">⚡</span>
                    <span class="logo-text">ZOLO<span class="accent">-A6-9V</span>×NuNa</span>
                    <p>AI-Powered Trading & Automation Platform</p>
                </div>
                <div class="footer-links">
                    <div class="footer-col">
                        <h4>Resources</h4>
                        <a href="#docs">Documentation</a>
                        <a href="#getting-started">Quick Start</a>
                        <a href="https://github.com/Mouy-leng/ZOLO-A6-9VxNUNA-" target="_blank" rel="noopener">GitHub</a>
                    </div>
                    <div class="footer-col">
                        <h4>Projects</h4>
                        <a href="https://github.com/Mouy-leng/GenX_FX" target="_blank" rel="noopener">GenX FX</a>
                        <a href="https://github.com/A6-9V/my-drive-projects" target="_blank" rel="noopener">Drive Projects</a>
                        <a href="https://github.com/Mouy-leng" target="_blank" rel="noopener">All Repos</a>
                    </div>
                    <div class="footer-col">
                        <h4>Connect</h4>
                        <a href="https://github.com/Mouy-leng" target="_blank" rel="noopener">GitHub Profile</a>
                        <a href="https://github.com/A6-9V" target="_blank" rel="noopener">A6-9V Org</a>
                        <a href="https://orcid.org/0009-0009-3473-2131" target="_blank" rel="noopener">ORCID</a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 A6-9V Organization. All rights reserved.</p>
                <p class="footer-secure">
                    <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
                        <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
                    </svg>
                    Secured with HTTPS
                </p>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="js/main.js"></script>
</body>
</html>
```

## 2. CSS Styling

Copy the following code and paste it into the CSS editor in your `soloist.ai` project.

```css
/* ============================================
   ZOLO-A6-9VxNUNA Website Styles
   A6-9V Organization - 2025
   ============================================ */

/* CSS Variables - Dark Cyber Theme */
:root {
    /* Primary Colors */
    --primary: #00ff88;
    --primary-dim: #00cc6a;
    --primary-glow: rgba(0, 255, 136, 0.3);

    /* Accent Colors */
    --accent: #00d4ff;
    --accent-dim: #00a8cc;
    --accent-glow: rgba(0, 212, 255, 0.3);

    /* Warning/Alert */
    --warning: #ffcc00;
    --error: #ff4757;
    --success: #00ff88;

    /* Background Colors */
    --bg-dark: #0a0e14;
    --bg-darker: #060a0f;
    --bg-card: #0f1419;
    --bg-card-hover: #151b22;
    --bg-elevated: #1a2028;

    /* Text Colors */
    --text-primary: #e6edf3;
    --text-secondary: #8b949e;
    --text-muted: #484f58;

    /* Borders */
    --border: #21262d;
    --border-light: #30363d;

    /* Gradients */
    --gradient-primary: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
    --gradient-dark: linear-gradient(180deg, var(--bg-dark) 0%, var(--bg-darker) 100%);
    --gradient-glow: radial-gradient(ellipse at center, var(--primary-glow) 0%, transparent 70%);

    /* Typography */
    --font-display: 'Outfit', -apple-system, BlinkMacSystemFont, sans-serif;
    --font-mono: 'JetBrains Mono', 'Fira Code', monospace;

    /* Spacing */
    --space-xs: 0.25rem;
    --space-sm: 0.5rem;
    --space-md: 1rem;
    --space-lg: 1.5rem;
    --space-xl: 2rem;
    --space-2xl: 3rem;
    --space-3xl: 4rem;

    /* Border Radius */
    --radius-sm: 4px;
    --radius-md: 8px;
    --radius-lg: 12px;
    --radius-xl: 16px;
    --radius-full: 9999px;

    /* Transitions */
    --transition-fast: 150ms ease;
    --transition-base: 250ms ease;
    --transition-slow: 400ms ease;

    /* Shadows */
    --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.5);
    --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.4);
    --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.3);
    --shadow-glow: 0 0 20px var(--primary-glow);
}

/* Reset & Base */
*, *::before, *::after {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

html {
    scroll-behavior: smooth;
    font-size: 16px;
}

body {
    font-family: var(--font-display);
    background: var(--bg-dark);
    color: var(--text-primary);
    line-height: 1.6;
    overflow-x: hidden;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

/* Background Effects */
.bg-grid {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-image:
        linear-gradient(rgba(0, 255, 136, 0.03) 1px, transparent 1px),
        linear-gradient(90deg, rgba(0, 255, 136, 0.03) 1px, transparent 1px);
    background-size: 50px 50px;
    pointer-events: none;
    z-index: 0;
}

.bg-glow {
    position: fixed;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle at 30% 20%, rgba(0, 255, 136, 0.08) 0%, transparent 50%),
                radial-gradient(circle at 70% 80%, rgba(0, 212, 255, 0.06) 0%, transparent 50%);
    pointer-events: none;
    z-index: 0;
    animation: glowPulse 10s ease-in-out infinite;
}

@keyframes glowPulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.7; }
}

/* Container */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 var(--space-lg);
    position: relative;
    z-index: 1;
}

/* Typography */
h1, h2, h3, h4, h5, h6 {
    font-weight: 700;
    line-height: 1.2;
    letter-spacing: -0.02em;
}

a {
    color: var(--primary);
    text-decoration: none;
    transition: color var(--transition-fast);
}

a:hover {
    color: var(--accent);
}

/* Navigation */
.navbar {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 1000;
    background: rgba(10, 14, 20, 0.85);
    backdrop-filter: blur(20px);
    border-bottom: 1px solid var(--border);
    padding: var(--space-md) 0;
}

.nav-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 var(--space-lg);
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.nav-logo {
    display: flex;
    align-items: center;
    gap: var(--space-sm);
    font-size: 1.25rem;
    font-weight: 700;
    color: var(--text-primary);
}

.logo-icon {
    font-size: 1.5rem;
}

.logo-text .accent {
    color: var(--primary);
}

.nav-links {
    display: flex;
    align-items: center;
    gap: var(--space-xl);
}

.nav-link {
    color: var(--text-secondary);
    font-weight: 500;
    font-size: 0.9rem;
    position: relative;
    padding: var(--space-xs) 0;
}

.nav-link::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0;
    height: 2px;
    background: var(--gradient-primary);
    transition: width var(--transition-base);
}

.nav-link:hover {
    color: var(--text-primary);
}

.nav-link:hover::after {
    width: 100%;
}

.nav-btn {
    display: flex;
    align-items: center;
    gap: var(--space-sm);
    background: var(--bg-card);
    color: var(--text-primary);
    padding: var(--space-sm) var(--space-md);
    border-radius: var(--radius-md);
    font-weight: 500;
    font-size: 0.9rem;
    border: 1px solid var(--border);
    transition: all var(--transition-base);
}

.nav-btn:hover {
    background: var(--bg-card-hover);
    border-color: var(--primary);
    color: var(--primary);
}

.nav-toggle {
    display: none;
    flex-direction: column;
    gap: 4px;
    background: none;
    border: none;
    cursor: pointer;
    padding: var(--space-sm);
}

.nav-toggle span {
    width: 24px;
    height: 2px;
    background: var(--text-primary);
    border-radius: 2px;
    transition: var(--transition-fast);
}

/* Hero Section */
.hero {
    min-height: 100vh;
    display: grid;
    grid-template-columns: 1fr 1fr;
    align-items: center;
    gap: var(--space-3xl);
    padding: 120px var(--space-lg) var(--space-3xl);
    max-width: 1200px;
    margin: 0 auto;
    position: relative;
    z-index: 1;
}

.hero-content {
    animation: fadeInUp 0.8s ease-out;
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.hero-badge {
    display: inline-flex;
    align-items: center;
    gap: var(--space-sm);
    background: rgba(0, 255, 136, 0.1);
    border: 1px solid rgba(0, 255, 136, 0.3);
    padding: var(--space-xs) var(--space-md);
    border-radius: var(--radius-full);
    font-size: 0.85rem;
    color: var(--primary);
    margin-bottom: var(--space-lg);
}

.badge-dot {
    width: 8px;
    height: 8px;
    background: var(--primary);
    border-radius: 50%;
    animation: pulse 2s ease-in-out infinite;
}

@keyframes pulse {
    0%, 100% { opacity: 1; transform: scale(1); }
    50% { opacity: 0.5; transform: scale(1.2); }
}

.hero-title {
    font-size: clamp(2.5rem, 6vw, 4.5rem);
    font-weight: 800;
    line-height: 1.1;
    margin-bottom: var(--space-lg);
}

.title-line {
    display: block;
}

.title-line.accent {
    background: var(--gradient-primary);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

.hero-subtitle {
    font-size: 1.25rem;
    color: var(--text-secondary);
    margin-bottom: var(--space-xl);
    max-width: 500px;
}

.hero-stats {
    display: flex;
    gap: var(--space-xl);
    margin-bottom: var(--space-xl);
}

.stat {
    text-align: center;
}

.stat-value {
    display: block;
    font-size: 1.5rem;
    font-weight: 700;
    color: var(--primary);
    font-family: var(--font-mono);
}

.stat-label {
    font-size: 0.85rem;
    color: var(--text-muted);
    text-transform: uppercase;
    letter-spacing: 0.05em;
}

.hero-actions {
    display: flex;
    gap: var(--space-md);
    flex-wrap: wrap;
}

/* Buttons */
.btn {
    display: inline-flex;
    align-items: center;
    gap: var(--space-sm);
    padding: var(--space-md) var(--space-xl);
    border-radius: var(--radius-md);
    font-weight: 600;
    font-size: 1rem;
    transition: all var(--transition-base);
    cursor: pointer;
    border: none;
}

.btn-primary {
    background: var(--gradient-primary);
    color: var(--bg-dark);
    box-shadow: var(--shadow-glow);
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 0 30px var(--primary-glow);
    color: var(--bg-dark);
}

.btn-secondary {
    background: transparent;
    color: var(--text-primary);
    border: 1px solid var(--border-light);
}

.btn-secondary:hover {
    background: var(--bg-card);
    border-color: var(--primary);
    color: var(--primary);
}

/* Hero Visual / Terminal */
.hero-visual {
    animation: fadeInUp 0.8s ease-out 0.2s backwards;
}

.terminal {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    overflow: hidden;
    box-shadow: var(--shadow-lg);
}

.terminal-header {
    display: flex;
    align-items: center;
    gap: var(--space-md);
    padding: var(--space-md);
    background: var(--bg-darker);
    border-bottom: 1px solid var(--border);
}

.terminal-dots {
    display: flex;
    gap: var(--space-sm);
}

.dot {
    width: 12px;
    height: 12px;
    border-radius: 50%;
}

.dot.red { background: #ff5f56; }
.dot.yellow { background: #ffbd2e; }
.dot.green { background: #27ca40; }

.terminal-title {
    font-size: 0.85rem;
    color: var(--text-muted);
    font-family: var(--font-mono);
}

.terminal-body {
    padding: var(--space-lg);
    font-family: var(--font-mono);
    font-size: 0.9rem;
    line-height: 1.8;
}

.terminal-body pre {
    margin: 0;
    white-space: pre-wrap;
}

.terminal-body .prompt {
    color: var(--accent);
}

.terminal-body .cmd {
    color: var(--primary);
}

.terminal-body .output {
    color: var(--text-secondary);
}

.terminal-body .success {
    color: var(--primary);
    font-weight: 600;
}

.terminal-body .cursor {
    animation: blink 1s step-end infinite;
}

@keyframes blink {
    0%, 100% { opacity: 1; }
    50% { opacity: 0; }
}

/* Sections */
section {
    padding: var(--space-3xl) 0;
    position: relative;
    z-index: 1;
}

.section-header {
    text-align: center;
    margin-bottom: var(--space-3xl);
}

.section-badge {
    display: inline-block;
    background: rgba(0, 255, 136, 0.1);
    color: var(--primary);
    padding: var(--space-xs) var(--space-md);
    border-radius: var(--radius-full);
    font-size: 0.85rem;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    margin-bottom: var(--space-md);
}

.section-title {
    font-size: clamp(2rem, 4vw, 3rem);
    margin-bottom: var(--space-md);
}

.section-desc {
    color: var(--text-secondary);
    font-size: 1.1rem;
    max-width: 600px;
    margin: 0 auto;
}

/* Features Section */
.features {
    background: var(--bg-darker);
}

.features-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: var(--space-xl);
}

.feature-card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    padding: var(--space-xl);
    transition: all var(--transition-base);
}

.feature-card:hover {
    border-color: var(--primary);
    transform: translateY(-4px);
    box-shadow: var(--shadow-glow);
}

.feature-icon {
    width: 56px;
    height: 56px;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(0, 255, 136, 0.1);
    border-radius: var(--radius-md);
    color: var(--primary);
    margin-bottom: var(--space-lg);
}

.feature-card h3 {
    font-size: 1.25rem;
    margin-bottom: var(--space-sm);
}

.feature-card p {
    color: var(--text-secondary);
    font-size: 0.95rem;
}

/* Systems Section */
.systems-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: var(--space-xl);
}

.system-card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    padding: var(--space-xl);
    transition: all var(--transition-base);
}

.system-card.primary {
    border-color: var(--primary);
    background: linear-gradient(135deg, rgba(0, 255, 136, 0.05) 0%, var(--bg-card) 100%);
}

.system-card:hover {
    transform: translateY(-4px);
    box-shadow: var(--shadow-lg);
}

.system-status {
    display: flex;
    align-items: center;
    gap: var(--space-sm);
    font-size: 0.85rem;
    color: var(--text-muted);
    margin-bottom: var(--space-md);
}

.status-dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: var(--text-muted);
}

.status-dot.active {
    background: var(--primary);
    box-shadow: 0 0 8px var(--primary);
}

.system-card h3 {
    font-size: 1.25rem;
    margin-bottom: var(--space-sm);
    font-family: var(--font-mono);
}

.system-card p {
    color: var(--text-secondary);
    font-size: 0.95rem;
    margin-bottom: var(--space-md);
}

.system-link {
    font-family: var(--font-mono);
    font-size: 0.85rem;
    color: var(--accent);
    word-break: break-all;
}

/* Architecture Section */
.architecture {
    background: var(--bg-darker);
}

.arch-diagram {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: var(--space-md);
}

.arch-layer {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    padding: var(--space-lg);
    width: 100%;
    max-width: 800px;
}

.arch-title {
    font-size: 0.85rem;
    color: var(--primary);
    text-transform: uppercase;
    letter-spacing: 0.1em;
    margin-bottom: var(--space-md);
    text-align: center;
}

.arch-items {
    display: flex;
    justify-content: center;
    gap: var(--space-md);
    flex-wrap: wrap;
}

.arch-item {
    background: var(--bg-elevated);
    border: 1px solid var(--border-light);
    padding: var(--space-sm) var(--space-md);
    border-radius: var(--radius-md);
    font-family: var(--font-mono);
    font-size: 0.9rem;
}

.arch-connector {
    color: var(--primary);
}

/* Getting Started Section */
.steps {
    max-width: 800px;
    margin: 0 auto;
}

.step {
    display: flex;
    gap: var(--space-xl);
    margin-bottom: var(--space-xl);
}

.step-number {
    font-size: 3rem;
    font-weight: 800;
    color: var(--border-light);
    font-family: var(--font-mono);
    line-height: 1;
    min-width: 80px;
}

.step-content {
    flex: 1;
}

.step-content h3 {
    font-size: 1.25rem;
    margin-bottom: var(--space-md);
}

.code-block {
    display: flex;
    align-items: center;
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-md);
    padding: var(--space-md);
    gap: var(--space-md);
}

.code-block code {
    flex: 1;
    font-family: var(--font-mono);
    font-size: 0.9rem;
    color: var(--primary);
}

.copy-btn {
    background: none;
    border: none;
    color: var(--text-muted);
    cursor: pointer;
    padding: var(--space-xs);
    transition: color var(--transition-fast);
}

.copy-btn:hover {
    color: var(--primary);
}

/* Documentation Section */
.docs {
    background: var(--bg-darker);
}

.docs-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: var(--space-lg);
}

.doc-card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    padding: var(--space-xl);
    transition: all var(--transition-base);
    display: block;
    color: var(--text-primary);
}

.doc-card:hover {
    border-color: var(--accent);
    transform: translateY(-4px);
    color: var(--text-primary);
}

.doc-icon {
    font-size: 2rem;
    margin-bottom: var(--space-md);
}

.doc-card h3 {
    font-size: 1.1rem;
    margin-bottom: var(--space-sm);
}

.doc-card p {
    color: var(--text-secondary);
    font-size: 0.9rem;
}

/* System Info Section */
.system-info {
    padding: var(--space-2xl) 0;
}

.info-card {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: var(--radius-lg);
    padding: var(--space-xl);
}

.info-card h3 {
    font-size: 1.25rem;
    margin-bottom: var(--space-lg);
    text-align: center;
}

.info-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
    gap: var(--space-lg);
}

.info-item {
    text-align: center;
}

.info-label {
    display: block;
    font-size: 0.85rem;
    color: var(--text-muted);
    text-transform: uppercase;
    letter-spacing: 0.05em;
    margin-bottom: var(--space-xs);
}

.info-value {
    font-family: var(--font-mono);
    font-size: 0.95rem;
    color: var(--primary);
}

/* Footer */
.footer {
    background: var(--bg-darker);
    border-top: 1px solid var(--border);
    padding: var(--space-3xl) 0 var(--space-xl);
}

.footer-content {
    display: grid;
    grid-template-columns: 1fr 2fr;
    gap: var(--space-3xl);
    margin-bottom: var(--space-2xl);
}

.footer-brand {
    display: flex;
    flex-direction: column;
    gap: var(--space-sm);
}

.footer-brand .logo-icon {
    font-size: 2rem;
}

.footer-brand .logo-text {
    font-size: 1.25rem;
    font-weight: 700;
}

.footer-brand p {
    color: var(--text-secondary);
    font-size: 0.9rem;
}

.footer-links {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: var(--space-xl);
}

.footer-col h4 {
    font-size: 0.9rem;
    text-transform: uppercase;
    letter-spacing: 0.05em;
    margin-bottom: var(--space-md);
    color: var(--text-primary);
}

.footer-col a {
    display: block;
    color: var(--text-secondary);
    font-size: 0.9rem;
    margin-bottom: var(--space-sm);
    transition: color var(--transition-fast);
}

.footer-col a:hover {
    color: var(--primary);
}

.footer-bottom {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-top: var(--space-xl);
    border-top: 1px solid var(--border);
}

.footer-bottom p {
    color: var(--text-muted);
    font-size: 0.85rem;
}

.footer-secure {
    display: flex;
    align-items: center;
    gap: var(--space-xs);
    color: var(--primary) !important;
}

/* Responsive Design */
@media (max-width: 968px) {
    .hero {
        grid-template-columns: 1fr;
        text-align: center;
        padding-top: 100px;
    }

    .hero-subtitle {
        margin: 0 auto var(--space-xl);
    }

    .hero-stats {
        justify-content: center;
    }

    .hero-actions {
        justify-content: center;
    }

    .hero-visual {
        order: -1;
        max-width: 600px;
        margin: 0 auto;
    }

    .footer-content {
        grid-template-columns: 1fr;
        text-align: center;
    }

    .footer-links {
        justify-items: center;
    }

    .footer-bottom {
        flex-direction: column;
        gap: var(--space-md);
    }
}

@media (max-width: 768px) {
    .nav-links {
        display: none;
        position: absolute;
        top: 100%;
        left: 0;
        right: 0;
        background: var(--bg-dark);
        border-bottom: 1px solid var(--border);
        flex-direction: column;
        padding: var(--space-lg);
        gap: var(--space-md);
    }

    .nav-links.active {
        display: flex;
    }

    .nav-toggle {
        display: flex;
    }

    .step {
        flex-direction: column;
        gap: var(--space-md);
    }

    .step-number {
        font-size: 2rem;
    }

    .footer-links {
        grid-template-columns: 1fr;
        gap: var(--space-xl);
    }
}

@media (max-width: 480px) {
    .hero-title {
        font-size: 2rem;
    }

    .hero-stats {
        flex-direction: column;
        gap: var(--space-md);
    }

    .hero-actions {
        flex-direction: column;
    }

    .btn {
        width: 100%;
        justify-content: center;
    }

    .features-grid,
    .systems-grid,
    .docs-grid {
        grid-template-columns: 1fr;
    }

    .arch-items {
        flex-direction: column;
    }
}

/* Utilities */
.accent {
    color: var(--primary);
}

/* Scrollbar */
::-webkit-scrollbar {
    width: 10px;
}

::-webkit-scrollbar-track {
    background: var(--bg-darker);
}

::-webkit-scrollbar-thumb {
    background: var(--border-light);
    border-radius: 5px;
}

::-webkit-scrollbar-thumb:hover {
    background: var(--text-muted);
}

/* Selection */
::selection {
    background: var(--primary);
    color: var(--bg-dark);
}
```

## 3. JavaScript Functionality

Copy the following code and paste it into the JavaScript editor in your `soloist.ai` project.

```javascript
/**
 * ZOLO-A6-9VxNUNA Website JavaScript
 * A6-9V Organization - 2025
 */

// DOM Ready
document.addEventListener('DOMContentLoaded', () => {
    initNavigation();
    initScrollEffects();
    initAnimations();
    initCopyButtons();
});

/**
 * Navigation functionality
 */
function initNavigation() {
    const navToggle = document.querySelector('.nav-toggle');
    const navLinks = document.querySelector('.nav-links');

    if (navToggle && navLinks) {
        navToggle.addEventListener('click', () => {
            navLinks.classList.toggle('active');
            navToggle.classList.toggle('active');
        });

        // Close menu on link click
        navLinks.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', () => {
                navLinks.classList.remove('active');
                navToggle.classList.remove('active');
            });
        });
    }

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;

            const target = document.querySelector(targetId);
            if (target) {
                e.preventDefault();
                const navHeight = document.querySelector('.navbar').offsetHeight;
                const targetPosition = target.offsetTop - navHeight - 20;

                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });
}

/**
 * Scroll effects
 */
function initScrollEffects() {
    const navbar = document.querySelector('.navbar');
    let lastScroll = 0;

    window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset;

        // Navbar background on scroll
        if (currentScroll > 50) {
            navbar.style.background = 'rgba(10, 14, 20, 0.95)';
        } else {
            navbar.style.background = 'rgba(10, 14, 20, 0.85)';
        }

        lastScroll = currentScroll;
    });
}

/**
 * Intersection Observer for animations
 */
function initAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Observe elements
    const animateElements = document.querySelectorAll(
        '.feature-card, .system-card, .doc-card, .step, .arch-layer'
    );

    animateElements.forEach((el, index) => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = `all 0.6s ease ${index * 0.1}s`;
        observer.observe(el);
    });

    // Add CSS for animation
    const style = document.createElement('style');
    style.textContent = `
        .animate-in {
            opacity: 1 !important;
            transform: translateY(0) !important;
        }
    `;
    document.head.appendChild(style);
}

/**
 * Copy to clipboard functionality
 */
function initCopyButtons() {
    window.copyCode = function(btn) {
        const codeBlock = btn.closest('.code-block');
        const code = codeBlock.querySelector('code').textContent;

        navigator.clipboard.writeText(code).then(() => {
            // Show feedback
            const originalHTML = btn.innerHTML;
            btn.innerHTML = `
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <polyline points="20 6 9 17 4 12"/>
                </svg>
            `;
            btn.style.color = 'var(--primary)';

            setTimeout(() => {
                btn.innerHTML = originalHTML;
                btn.style.color = '';
            }, 2000);
        }).catch(err => {
            console.error('Failed to copy:', err);
        });
    };
}

/**
 * Terminal typing effect (optional enhancement)
 */
function typeWriter(element, text, speed = 50) {
    let i = 0;
    element.textContent = '';

    function type() {
        if (i < text.length) {
            element.textContent += text.charAt(i);
            i++;
            setTimeout(type, speed);
        }
    }

    type();
}

/**
 * Utility: Debounce function
 */
function debounce(func, wait = 100) {
    let timeout;
    return function(...args) {
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(this, args), wait);
    };
}

/**
 * Utility: Throttle function
 */
function throttle(func, limit = 100) {
    let inThrottle;
    return function(...args) {
        if (!inThrottle) {
            func.apply(this, args);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    };
}

// Console branding
console.log(`
%c⚡ ZOLO-A6-9VxNUNA %c
AI-Powered Trading & Automation Platform
https://github.com/Mouy-leng/ZOLO-A6-9VxNUNA-

© 2025 A6-9V Organization
`, 'color: #00ff88; font-size: 20px; font-weight: bold;', 'color: #8b949e;');
```

## 4. Static Assets (Images and Links)

**Important:** The HTML code references images and links to other pages (e.g., `assets/og-image.png`, `docs/device-skeleton.html`). These files are not present in this repository.

*   **Images:** You will need to upload your own images to `soloist.ai` and replace the `src` attributes in the HTML with the correct URLs.
*   **Links:** The links to other pages will not work. You will need to create those pages separately within `soloist.ai` and update the `href` attributes in the HTML.

## 5. Favicon Asset

Copy the following code and save it as `favicon.svg` on your computer. Then, upload this file to your `soloist.ai` project when prompted for a favicon.

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
  <defs>
    <linearGradient id="grad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" style="stop-color:#00ff88;stop-opacity:1" />
      <stop offset="100%" style="stop-color:#00d4ff;stop-opacity:1" />
    </linearGradient>
  </defs>
  <rect width="100" height="100" rx="20" fill="#0a0e14"/>
  <path d="M25 70 L45 30 L55 50 L75 30" stroke="url(#grad)" stroke-width="8" stroke-linecap="round" stroke-linejoin="round" fill="none"/>
  <circle cx="75" cy="30" r="8" fill="#00ff88"/>
</svg>
```
