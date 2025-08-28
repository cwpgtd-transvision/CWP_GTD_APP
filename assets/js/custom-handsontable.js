$(document).ready(function () {
    // Basic Tables
    BasicTable();
    //Autosave and save and Load Table
    SaveAndLoadDataTable();
    // Column Readonly
    ColumnAndRowReadonlyTable();
    // column freez 
    ColumnAndRowFreezeDatatable();
    // Row freez 
    RowAndColumnMurgeDatatable();

    // Farmula Caluctation
    FormulaCaluctatedDatatable()

    //Fully Functioned Handsontable
    FullyFunctionedDatatable();
});
function BasicTable() {
    const container = document.querySelector('#basicTable');

    const colHeaders = ['Year', 'Tesla', 'Nissan', 'Toyota', 'Honda', 'Mazda', 'Ford'];
    const data = [
        ['2017', 10, 11, 12, 13, 15, 16],
        ['2018', 10, 11, 12, 13, 15, 16],
        ['2019', 10, 11, 12, 13, 15, 16],
        ['2020', 10, 11, 12, 13, 15, 16],
        ['2021', 10, 11, 12, 13, 15, 16],
    ];

    const hot = new Handsontable(container, {
        data: data,
        colHeaders: colHeaders,
        rowHeaders: true,
        stretchH: 'all',
        width: '100%',
        height: 'auto',
        rowHeights: 10,
        autoWrapRow: true,
        autoWrapCol: true,
        manualColumnResize: true,
        manualRowResize: true,
        manualColumnMove: true,
        manualRowMove: true,
        className: 'htCenter htMiddle',
        licenseKey: 'non-commercial-and-evaluation'
    });

    // Export to Excel with headers
    $('#exportExcel').click(function () {
        const headers = hot.getColHeader();
        const exportData = hot.getData();
        const fullData = [headers, ...exportData];

        const ws = XLSX.utils.aoa_to_sheet(fullData);
        const wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
        XLSX.writeFile(wb, 'HandsontableData.xlsx');
    });

    // Export to CSV with headers
    $('#exportCsv').click(function () {
        const headers = hot.getColHeader();
        const exportData = hot.getData();
        const fullData = [headers, ...exportData];

        const ws = XLSX.utils.aoa_to_sheet(fullData);
        const csv = XLSX.utils.sheet_to_csv(ws);
        const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
        saveAs(blob, 'HandsontableData.csv');
    });

    // Export to PDF with title, headers, data, and footer date
    $('#exportPdf').click(function () {
        const headers = hot.getColHeader();
        const exportData = hot.getData();
        const fullData = [headers, ...exportData];

        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();

        const pageWidth = doc.internal.pageSize.getWidth();
        const pageHeight = doc.internal.pageSize.getHeight();
        const rowHeight = 8, padding = 3;
        const colWidth = (pageWidth - 20) / headers.length;

        let y = 20;

        // Title
        doc.setFont('helvetica', 'bold');
        doc.setFontSize(16);
        doc.text('Car Sales Report', pageWidth / 2, 12, { align: 'center' });

        // Table
        fullData.forEach(row => {
            let x = 10;
            row.forEach(cell => {
                doc.setDrawColor(0);
                doc.setLineWidth(0.2);
                doc.rect(x, y, colWidth, rowHeight);
                doc.setFontSize(10);
                doc.text(String(cell), x + padding, y + rowHeight / 2 + 2.5);
                x += colWidth;
            });
            y += rowHeight;
        });

        // Footer
        doc.setFont('helvetica', 'normal');
        doc.setFontSize(10);
        //doc.text(`Generated on: ${new Date().toLocaleDateString()}`, 10, pageHeight - 10);
        doc.text(`Generated on: ${formatDateTime(new Date())}`, margin, pageHeight - 10);
        doc.save('HandsontableData.pdf');
    });
}

function SaveAndLoadDataTable() {
    const container = document.querySelector('#SaveAndLoadDataTable');
    const exampleConsole = document.querySelector('#output');
    const autosave = document.querySelector('#autosave');
    const load = document.querySelector('#load');
    const save = document.querySelector('#save');

    const hot = new Handsontable(container, {
        startRows: 8,
        startCols: 6,
        colHeaders: true,
        rowHeaders: true,
        stretchH: 'all',
        width: '100%',
        height: 'auto',
        rowHeights: 10,
        autoWrapRow: true,
        autoWrapCol: true,
        manualColumnResize: true,
        manualRowResize: true,
        manualColumnMove: true,
        manualRowMove: true,
        className: 'htCenter htMiddle',
        licenseKey: 'non-commercial-and-evaluation',
        afterChange(change, source) {
            if (source === 'loadData' || !change || !autosave.checked) return;

            fetch('https://handsontable.com/docs/scripts/json/save.json', {
                method: 'POST',
                mode: 'no-cors',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ data: change }),
            }).then(() => {
                exampleConsole.innerText = `Autosaved (${change.length} cell${change.length > 1 ? 's' : ''})`;
            });
        }
    });

    // Load Data
    load.addEventListener('click', () => {
        fetch('https://handsontable.com/docs/scripts/json/load.json')
            .then(res => res.json())
            .then(data => {
                hot.updateSettings({ data: data.data }); // Fix: load properly
                exampleConsole.innerText = 'Data loaded';
            });
    });

    // Save Data
    save.addEventListener('click', () => {
        fetch('https://handsontable.com/docs/scripts/json/save.json', {
            method: 'POST',
            mode: 'no-cors',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ data: hot.getData() }),
        }).then(() => {
            exampleConsole.innerText = 'Data saved';
        });
    });

    // Toggle Autosave
    autosave.addEventListener('click', () => {
        exampleConsole.innerText = autosave.checked
            ? 'Changes will be autosaved'
            : 'Changes will not be autosaved';
    });

    // Export to Excel
    $('#exportExcel1').click(function () {
        const headers = hot.getColHeader();
        const data = hot.getData();
        const fullData = [headers, ...data];

        const ws = XLSX.utils.aoa_to_sheet(fullData);
        const wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');
        XLSX.writeFile(wb, 'HandsontableData.xlsx');
    });

    // Export to CSV
    $('#exportCsv1').click(function () {
        const headers = hot.getColHeader();
        const data = hot.getData();
        const fullData = [headers, ...data];

        const ws = XLSX.utils.aoa_to_sheet(fullData);
        const csv = XLSX.utils.sheet_to_csv(ws);
        const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
        saveAs(blob, 'HandsontableData.csv');
    });

    // Export to PDF
    $('#exportPdf1').click(function () {
        const headers = hot.getColHeader();
        const data = hot.getData();
        const fullData = [headers, ...data];

        const { jsPDF } = window.jspdf;
        const doc = new jsPDF();
        const pageWidth = doc.internal.pageSize.getWidth();
        const pageHeight = doc.internal.pageSize.getHeight();
        const rowHeight = 8, padding = 3;
        const colWidth = (pageWidth - 20) / headers.length;
        let y = 20;

        doc.setFont('helvetica', 'bold');
        doc.setFontSize(16);
        doc.text('Data Report', pageWidth / 2, 12, { align: 'center' });

        fullData.forEach(row => {
            let x = 10;
            row.forEach(cell => {
                doc.setDrawColor(0);
                doc.setLineWidth(0.2);
                doc.rect(x, y, colWidth, rowHeight);
                doc.setFontSize(10);
                doc.text(String(cell), x + padding, y + rowHeight / 2 + 2.5);
                x += colWidth;
            });
            y += rowHeight;
        });

        doc.setFont('helvetica', 'normal');
        doc.setFontSize(10);
        //doc.text(`Generated on: ${new Date().toLocaleDateString()}`, 10, pageHeight - 10);
        doc.text(`Generated on: ${formatDateTime(new Date())}`, margin, pageHeight - 10);
        doc.save('HandsontableData.pdf');
    });
}

function ColumnAndRowReadonlyTable() {
    const container = document.querySelector('#ColumnAndRowReadonlyTable');

    const data = [
        ['A1', 'B1', 'C1', 'D1', 'E1', 'F1', 'G1', 'H1', 'I1', 'J1'],
        ['A2', 'B2', 'C2', 'D2', 'E2', 'F2', 'G2', 'H2', 'I2', 'J2'],
        ['A3', 'B3', 'C3', 'D3', 'E3', 'F3', 'G3', 'H3', 'I3', 'J3'],
        ['A4', 'B4', 'C4', 'D4', 'E4', 'F4', 'G4', 'H4', 'I4', 'J4'],
        ['A5', 'B5', 'C5', 'D5', 'E5', 'F5', 'G5', 'H5', 'I5', 'J5'],
        ['A6', 'B6', 'C6', 'D6', 'E6', 'F6', 'G6', 'H6', 'I6', 'J6'],
        ['A7', 'B7', 'C7', 'D7', 'E7', 'F7', 'G7', 'H7', 'I7', 'J7'],
        ['A8', 'B8', 'C8', 'D8', 'E8', 'F8', 'G8', 'H8', 'I8', 'J8'],
        ['A9', 'B9', 'C9', 'D9', 'E9', 'F9', 'G9', 'H9', 'I9', 'J9'],
        ['A10', 'B10', 'C10', 'D10', 'E10', 'F10', 'G10', 'H10', 'I10', 'J10'],
    ];

    const colHeaders = ['Col 1', 'Col 2', 'Col 3 (RO)', 'Col 4', 'Col 5', 'Col 6', 'Col 7', 'Col 8', 'Col 9 (RO)', 'Col 10'];

    const hot = new Handsontable(container, {
        data: data,
        colHeaders: colHeaders,
        rowHeaders: false,
        width: '100%',
        height: '350px',
        rowHeights: 10,
        stretchH: 'all',
        //fixedRowsTop: 2,
        //fixedColumnsStart: 1,
        manualColumnResize: true,
        manualRowResize: true,
        manualColumnMove: true,
        manualRowMove: true,
        autoWrapRow: true,
        autoWrapCol: true,
        className: 'htCenter htMiddle',
        licenseKey: 'non-commercial-and-evaluation',

        // Declare column-wise config first
        columns: (index) => ({
            type: 'text',
            readOnly: (index === 2 || index === 8) // Read-only columns
        }),

        // Then override readOnly for specific rows using `cells`
        cells: (row, col) => {
            if (row === 1 || row === 4) {
                return { readOnly: true };
            }
            return {};
        }
    });
}

function ColumnAndRowFreezeDatatable() {

    // generate an array of arrays with dummy data
    const data = new Array(100) // number of rows
        .fill(null)
        .map((_, row) =>
            new Array(50) // number of columns
                .fill(null)
                .map((_, column) => `${row}, ${column}`)
        );

    const container = document.querySelector('#ColumnAndRowFreezeDatatable');

    new Handsontable(container, {
        data,
        colWidths: 100,
        width: '100%',
        height: 320,
        rowHeaders: true,
        colHeaders: true,
        fixedColumnsStart: 1,
        fixedRowsTop: 2,
        rowHeights: 10,
        autoWrapRow: true,
        autoWrapCol: true,
        licenseKey: 'non-commercial-and-evaluation',
    });
}

function RowAndColumnMurgeDatatable() {


    // generate an array of arrays with dummy data
    const data = new Array(100) // number of rows
        .fill(null)
        .map((_, row) =>
            new Array(50) // number of columns
                .fill(null)
                .map((_, column) => `${row}, ${column}`)
        );

    const container = document.querySelector('#RowAndColumnMurgeDatatable');

    new Handsontable(container, {
        data,
        height: 320,
        colWidths: 50,
        rowHeaders: true,
        colHeaders: true,
        contextMenu: true,
        mergeCells: [
            { row: 1, col: 1, rowspan: 3, colspan: 3 },
            { row: 3, col: 4, rowspan: 2, colspan: 2 },
            { row: 5, col: 6, rowspan: 3, colspan: 3 },
        ],
        autoWrapRow: true,
        autoWrapCol: true,
        licenseKey: 'non-commercial-and-evaluation',
    });
}

function FormulaCaluctatedDatatable() {


    const data1 = [
        ['10.26', null, 'Sum', '=SUM(A:A)'],
        ['20.12', null, 'Average', '=AVERAGE(A:A)'],
        ['30.01', null, 'Median', '=MEDIAN(A:A)'],
        ['40.29', null, 'MAX', '=MAX(A:A)'],
        ['50.18', null, 'MIN', '=MIN(A1:A5)'],
    ];

    const data2 = [
        ['Is A1 in Sheet1 > 10?', '=IF(Sheet1!A1>10,"TRUE","FALSE")'],
        ['Is A:A in Sheet > 150?', '=IF(SUM(Sheet1!A:A)>150,"TRUE","FALSE")'],
        ['How many blank cells are in the Sheet1?', '=COUNTBLANK(Sheet1!A1:D5)'],
        ['Generate a random number', '=RAND()'],
        ['Number of sheets in this workbook', '=SHEETS()'],
    ];

    // create an external HyperFormula instance
    const hyperformulaInstance = HyperFormula.buildEmpty({
        // to use an external HyperFormula instance,
        // initialize it with the `'internal-use-in-handsontable'` license key
        licenseKey: 'internal-use-in-handsontable',
    });

    const container1 = document.querySelector('#FormulaCaluctatedDatatable');

    new Handsontable(container1, {
        data: data1,
        colHeaders: true,
        rowHeaders: true,
        height: 'auto',
        formulas: {
            engine: hyperformulaInstance,
            sheetName: 'Sheet1',
        },
        autoWrapRow: true,
        autoWrapCol: true,
        licenseKey: 'non-commercial-and-evaluation',
    });

    const container2 = document.querySelector('#FormulaCaluctationDatatable');

    new Handsontable(container2, {
        data: data2,
        colHeaders: true,
        rowHeaders: true,
        height: 'auto',
        formulas: {
            engine: hyperformulaInstance,
            sheetName: 'Sheet2',
        },
        autoWrapRow: true,
        autoWrapCol: true,
        licenseKey: 'non-commercial-and-evaluation',
    });
}

function FullyFunctionedDatatable() {
    const container = document.querySelector('#FullyFunctionedDatatable');
    const data = [
        ["Jerry Moen", 22, "Canada", "Toronto", true, "Beauty & Personal Care", "Elegant Concrete Hat", "2025-11-25", "06:02"],
        ["Lloyd Auer", 22, "Australia", "Sydney", false, "Fashion", "Licensed Concrete Pants", "2025-08-06", "13:24"],
        ["Bob Bahringer II", 56, "UK", "London", true, "Books & Literature", "Rustic Rubber Mouse", "2025-07-14", "08:15"],
        ["Adrian Murphy", 58, "Germany", "Walldorf", true, "Home Decor", "Handcrafted Granite Car", "2025-02-07", "06:40"],
        ["Juan Yost", 26, "Spain", "Madrid", true, "Home Decor", "Handmade Bronze Towels", "2025-06-22", "21:44"],
        ["Brandon Dare", 32, "China", "Shenzhen", false, "Fashion", "Intelligent Soft Soap", "2025-10-04", "20:12"],
        ["Laura Reynolds", 38, "France", "Lyon", true, "Fashion", "Intelligent Plastic Shoes", "2025-02-06", "13:56"],
        ["Brendan Raynor", 60, "Netherlands", "Amsterdam", false, "Fashion", "Recycled Concrete Towels", "2025-02-19", "13:56"],
        ["Audrey Blick", 50, "Switzerland", "Zurich", true, "Fashion", "Generic Cotton Salad", "2025-06-16", "15:45"],
        ["Jessie Crona V", 27, "Mexico", "Mexico City", true, "Home Decor", "Luxurious Granite Cheese", "2025-12-08", "17:55"],
        ["Mr. Shaun Wolff", 52, "Canada", "Toronto", false, "Tech Gadgets", "Modern Granite Keyboard", "2025-05-02", "02:16"],
        ["Mattie Bergnaum", 28, "Canada", "Vancouver", true, "Fashion", "Oriental Soft Pizza", "2025-06-11", "23:08"],
        ["Mr. Wayne Franecki", 39, "Mexico", "Mexico City", false, "Tech Gadgets", "Modern Plastic Chips", "2025-10-25", "23:38"],
        ["Dr. Kristy Corwin", 34, "Mexico", "Mexico City", true, "Travel & Adventure", "Small Granite Bacon", "2025-01-11", "13:44"],
        ["Kathy Hickle", 25, "Australia", "Sydney", false, "Food & Cooking", "Oriental Plastic Table", "2025-01-01", "09:27"],
        ["Dana Jacobi", 56, "USA", "Los Angeles", true, "Home Decor", "Bespoke Bronze Tuna", "2025-08-10", "19:11"],
        ["Miss Juana Schulist", 52, "Japan", "Tokyo", false, "Electronics", "Unbranded Metal Pants", "2025-12-23", "02:58"],
        ["Krista Kunze", 50, "Japan", "Tokyo", true, "Beauty & Personal Care", "Awesome Metal Cheese", "2025-07-10", "08:28"]
    ];

    const hot = new Handsontable(container, {
        data: data,
        colHeaders: ["Name", "Age", "Country", "City", "Active", "Interest", "Favorite Product", "Login date", "Login time"],
        columns: [
            { type: 'text' },
            { type: 'numeric' },
            { type: 'dropdown', source: ["Canada", "Australia", "UK", "Germany", "Spain", "China", "France", "Netherlands", "Switzerland", "Mexico", "USA", "Japan"] },
            { type: 'text' },
            { type: 'checkbox' },
            { type: 'dropdown', source: ["Beauty & Personal Care", "Fashion", "Books & Literature", "Home Decor", "Tech Gadgets", "Travel & Adventure", "Food & Cooking", "Electronics"] },
            { type: 'text' },
            { type: 'date', dateFormat: 'YYYY-MM-DD', correctFormat: true },
            { type: 'time', timeFormat: 'HH:mm', correctFormat: true }
        ],
        filters: true,
        dropdownMenu: ['filter_by_condition', 'filter_by_value', 'filter_action_bar'],
        contextMenu: {
            items: {
                row_above: {},
                row_below: {},
                remove_row: {},
                undo: {},
                redo: {},
                alignment: {},
            }
        },
        rowHeaders: true,
        licenseKey: 'non-commercial-and-evaluation',
        stretchH: 'all',
        height: 'auto',
    });

    // Export to Excel
    // Export to Excel with borders and header styling
    $('#exportExcel6').click(async function () {
        const headers = hot.getColHeader();
        const data = hot.getData();

        const workbook = new ExcelJS.Workbook();
        const worksheet = workbook.addWorksheet("User Report");

        // Title row
        const title = worksheet.addRow(["User Account Report"]);
        title.font = { size: 16, bold: true };
        worksheet.mergeCells('A1:I1');
        worksheet.getCell('A1').alignment = { horizontal: 'center' };

        worksheet.addRow([]); // empty row

        // Header row
        const headerRow = worksheet.addRow(headers);
        headerRow.eachCell(cell => {
            cell.font = { bold: true };
            cell.fill = {
                type: 'pattern',
                pattern: 'solid',
                fgColor: { argb: 'DCE6F1' }
            };
            cell.border = {
                top: { style: 'thin' },
                left: { style: 'thin' },
                bottom: { style: 'thin' },
                right: { style: 'thin' }
            };
            cell.alignment = { vertical: 'middle', horizontal: 'center' };
        });

        // Data rows
        data.forEach(rowData => {
            const row = worksheet.addRow(rowData);
            row.eachCell(cell => {
                cell.border = {
                    top: { style: 'thin' },
                    left: { style: 'thin' },
                    bottom: { style: 'thin' },
                    right: { style: 'thin' }
                };
            });
        });

        // Auto-width columns
        worksheet.columns.forEach(col => {
            let maxLength = 10;
            col.eachCell({ includeEmpty: true }, cell => {
                const val = cell.value ? cell.value.toString() : '';
                maxLength = Math.max(maxLength, val.length);
            });
            col.width = maxLength + 2;
        });

        // Save file
        const buffer = await workbook.xlsx.writeBuffer();
        const blob = new Blob([buffer], { type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" });
        saveAs(blob, "HandsontableData_Bordered.xlsx");
    });
    // Export to CSV
    $('#exportCsv6').click(function () {
        const headers = hot.getColHeader();
        const exportData = hot.getData();
        const fullData = [headers, ...exportData];
        const ws = XLSX.utils.aoa_to_sheet(fullData);
        const csv = XLSX.utils.sheet_to_csv(ws);
        const blob = new Blob([csv], { type: 'text/csv;charset=utf-8;' });
        saveAs(blob, 'HandsontableData.csv');
    });

    // Export to PDF with header background and table borders
    $('#exportPdf6').click(function () {
        const headers = ['Sl.No', ...hot.getColHeader()];
        const exportData = hot.getData().map((row, index) => [index + 1, ...row]);

        const { jsPDF } = window.jspdf;
        const doc = new jsPDF('l', 'mm', 'a4'); // Landscape A4

        const pageWidth = doc.internal.pageSize.getWidth();
        const pageHeight = doc.internal.pageSize.getHeight();
        const margin = 10;
        const colPadding = 1.5;
        const fontSize = 10;
        const rowLineHeight = fontSize * 0.35 + 1.5;

        doc.setFontSize(fontSize);
        doc.setFont('helvetica', 'normal');

        const fullData = [headers, ...exportData];
        const colCount = headers.length;

        // Step 1: Calculate max width per column
        const colWidths = Array(colCount).fill(0);
        for (let c = 0; c < colCount; c++) {
            for (let r = 0; r < fullData.length; r++) {
                const cellText = String(fullData[r][c] ?? '');
                const cellLines = doc.splitTextToSize(cellText, 1000); // large limit
                const maxLine = Math.max(...cellLines.map(line => doc.getTextWidth(line)));
                if (maxLine + 2 * colPadding > colWidths[c]) {
                    colWidths[c] = maxLine + 2 * colPadding;
                }
            }
        }

        // Step 2: Normalize widths to fit page
        const totalWidth = colWidths.reduce((sum, w) => sum + w, 0);
        const scale = (pageWidth - 2 * margin) / totalWidth;
        const scaledColWidths = colWidths.map(w => w * scale);

        let y = 20;

        function formatDateTime(date) {
            const pad = n => n.toString().padStart(2, '0');
            const dd = pad(date.getDate());
            const MM = pad(date.getMonth() + 1);
            const yyyy = date.getFullYear();
            const hh = date.getHours();
            const mm = pad(date.getMinutes());
            const ss = pad(date.getSeconds());
            const ampm = hh >= 12 ? 'PM' : 'AM';
            const hh12 = pad(hh % 12 === 0 ? 12 : hh % 12);
            return `${dd}-${MM}-${yyyy} ${hh12}:${mm}:${ss} ${ampm}`;
        }

        function drawTitle() {
            doc.setFont('helvetica', 'bold');
            doc.setFontSize(16);
            doc.setTextColor(0);
            doc.text('User Account Report', pageWidth / 2, 12, { align: 'center' });
            doc.setFontSize(fontSize);
        }

        const centerAlignedColumns = ['Sl.No', 'Age', 'Active', 'Login date', 'Login time'];

        function drawHeaderRow(startY) {
            let x = margin;
            let maxHeight = 0;

            const headerLines = headers.map((header, i) =>
                doc.splitTextToSize(header, scaledColWidths[i] - 2 * colPadding)
            );

            headerLines.forEach(lines => {
                const height = lines.length * rowLineHeight + 2 * colPadding;
                if (height > maxHeight) maxHeight = height;
            });

            headers.forEach((header, i) => {
                const lines = headerLines[i];
                const cellWidth = scaledColWidths[i];

                doc.setFillColor(220, 230, 241); // Light blue
                doc.setDrawColor(0);
                doc.setTextColor(0);
                doc.setFont('helvetica', 'normal'); // no bold

                doc.rect(x, startY, cellWidth, maxHeight, 'FD');

                const verticalOffset = (maxHeight - lines.length * rowLineHeight) / 2;

                lines.forEach((line, j) => {
                    const textY = startY + verticalOffset + (j + 1) * rowLineHeight - 1;
                    const textX = x + cellWidth / 2;
                    doc.text(line, textX, textY, { align: 'center' });
                });

                x += cellWidth;
            });

            return startY + maxHeight;
        }

        drawTitle();
        y = drawHeaderRow(y);

        exportData.forEach(row => {
            let x = margin;

            const cellHeights = row.map((cell, i) => {
                const text = String(cell ?? '');
                const lines = doc.splitTextToSize(text, scaledColWidths[i] - 2 * colPadding);
                return lines.length * rowLineHeight + 2 * colPadding;
            });

            const maxCellHeight = Math.max(...cellHeights);

            if (y + maxCellHeight > pageHeight - 20) {
                doc.addPage();
                y = 20;
                drawTitle();
                y = drawHeaderRow(y);
            }

            row.forEach((cell, i) => {
                const text = String(cell ?? '');
                const lines = doc.splitTextToSize(text, scaledColWidths[i] - 2 * colPadding);
                const cellX = x;
                const cellY = y;

                doc.setFont('helvetica', 'normal');
                doc.setTextColor(0);
                doc.rect(cellX, cellY, scaledColWidths[i], maxCellHeight);

                const verticalOffset = (maxCellHeight - lines.length * rowLineHeight) / 2;

                lines.forEach((line, j) => {
                    const textY = cellY + verticalOffset + (j + 1) * rowLineHeight - 1;

                    if (centerAlignedColumns.includes(headers[i])) {
                        const textX = cellX + scaledColWidths[i] / 2;
                        doc.text(line, textX, textY, { align: 'center' });
                    } else {
                        doc.text(line, cellX + colPadding, textY);
                    }
                });

                x += scaledColWidths[i];
            });

            y += maxCellHeight;
        });

        doc.setFontSize(10);
        doc.setFont('helvetica', 'normal');
        doc.setTextColor(0);
        doc.text(`Generated on: ${formatDateTime(new Date())}`, margin, pageHeight - 10);

        doc.save('HandsontableData_AutoWidth.pdf');
    });



}

function formatDateTime(date) {
    const pad = (n) => n.toString().padStart(2, '0');
    const day = pad(date.getDate());
    const month = pad(date.getMonth() + 1);
    const year = date.getFullYear();
    const hours = date.getHours();
    const minutes = pad(date.getMinutes());
    const seconds = pad(date.getSeconds());
    const ampm = hours >= 12 ? 'PM' : 'AM';
    const formattedHour = pad(hours % 12 === 0 ? 12 : hours % 12);

    return `${day}-${month}-${year} ${formattedHour}:${minutes}:${seconds} ${ampm}`;
}
