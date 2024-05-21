/**
 * The function `applyFilter` retrieves XML data, applies an XSLT filter based on a user input
 * category, and displays the filtered result on the webpage.
 */
function applyFilter() {
    var input = document.getElementById('categoryInput').value;
    var xsl = new XMLHttpRequest();
    xsl.open('GET', 'style.xsl', false);
    xsl.send();
    var xslDoc = xsl.responseXML;

    var xml = new XMLHttpRequest();
    xml.open('GET', 'data.xml', false);
    xml.send();
    var xmlDoc = xml.responseXML;

    var xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(xslDoc);
    xsltProcessor.setParameter(null, 'categoryFilter', input);

    var resultDocument = xsltProcessor.transformToFragment(xmlDoc, document);

    document.getElementById('output').innerHTML = "";
    document.getElementById('output').appendChild(resultDocument);
}

/* The code snippet you provided is setting up an event handler for when the window has finished
loading. When the window loads, the function inside `window.onload` is executed. */
window.onload = function() {
    var filterSection = document.createElement('div');
    
    filterSection.className = 'form-group';
    filterSection.innerHTML = '<label for="categoryInput">Filtrar por categoría:</label>' +
                                '<input type="text" id="categoryInput" class="form-control" oninput="applyFilter()" placeholder="Ingrese una categoría"></input>';

    var container = document.getElementById('container');
    container.insertBefore(filterSection, container.firstChild);
};