const puppeteer = require('puppeteer');
const path = require('path');
const fs = require('fs');

async function generatePDF(htmlFile, outputFile) {
    console.log(`Generating PDF from ${htmlFile}...`);
    
    const browser = await puppeteer.launch({
        headless: true,
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    
    const page = await browser.newPage();
    
    // Read the HTML file
    const htmlPath = path.resolve(__dirname, htmlFile);
    const htmlContent = fs.readFileSync(htmlPath, 'utf8');
    
    // Set content
    await page.setContent(htmlContent, {
        waitUntil: 'networkidle0'
    });
    
    // Wait for fonts to load
    await page.evaluateHandle('document.fonts.ready');
    
    // Set viewport to landscape
    await page.setViewport({
        width: 1920,
        height: 1080
    });
    
    // Inject CSS to ensure proper page breaks and make all slides visible
    await page.addStyleTag({
        content: `
            @media print {
                body {
                    background: white !important;
                    margin: 0;
                    padding: 0;
                }
                .presentation-container {
                    width: 100% !important;
                    height: auto !important;
                    position: relative !important;
                }
                .slide {
                    display: block !important;
                    position: relative !important;
                    width: 100% !important;
                    height: auto !important;
                    min-height: 100vh !important;
                    page-break-after: always !important;
                    page-break-inside: avoid !important;
                    break-after: page !important;
                    break-inside: avoid !important;
                    margin: 0 !important;
                    padding: 60px 80px !important;
                }
                .navigation,
                .download-buttons,
                .progress-bar {
                    display: none !important;
                }
            }
        `
    });
    
    // Make all slides visible for PDF generation
    await page.evaluate(() => {
        const slides = document.querySelectorAll('.slide');
        const container = document.querySelector('.presentation-container');
        
        // Make container flow normally
        if (container) {
            container.style.position = 'relative';
            container.style.height = 'auto';
            container.style.width = '100%';
        }
        
        // Make all slides visible and properly formatted
        slides.forEach((slide, index) => {
            slide.style.display = 'block';
            slide.style.position = 'relative';
            slide.style.width = '100%';
            slide.style.height = 'auto';
            slide.style.minHeight = '100vh';
            slide.style.pageBreakAfter = 'always';
            slide.style.pageBreakInside = 'avoid';
            slide.style.breakAfter = 'page';
            slide.style.breakInside = 'avoid';
            slide.style.margin = '0';
            slide.style.padding = '60px 80px';
        });
        
        // Hide navigation and download buttons
        const nav = document.querySelector('.navigation');
        if (nav) nav.style.display = 'none';
        const downloadBtns = document.querySelector('.download-buttons');
        if (downloadBtns) downloadBtns.style.display = 'none';
        const progressBar = document.querySelector('.progress-bar');
        if (progressBar) progressBar.style.display = 'none';
    });
    
    // Wait a bit for styles to apply
    await page.waitForTimeout(500);
    
    // Generate PDF in landscape orientation
    await page.pdf({
        path: outputFile,
        width: '11.69in',  // A4 landscape width
        height: '8.27in',  // A4 landscape height
        printBackground: true,
        margin: {
            top: '0',
            right: '0',
            bottom: '0',
            left: '0'
        },
        preferCSSPageSize: false,
        displayHeaderFooter: false
    });
    
    await browser.close();
    console.log(`✓ PDF generated: ${outputFile}`);
}

async function main() {
    try {
        // Generate full presentation PDF
        await generatePDF('presentation.html', 'presentation.pdf');
        
        // Generate shortened presentation PDF
        await generatePDF('presentation-short.html', 'presentation-short.pdf');
        
        console.log('\n✓ All PDFs generated successfully!');
    } catch (error) {
        console.error('Error generating PDFs:', error);
        process.exit(1);
    }
}

main();
