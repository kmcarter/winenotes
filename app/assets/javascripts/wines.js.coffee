jQuery ->
  $("#wines").DataTable({
    responsive: true,
    tableTools: {
      sSwfPath: "/assets/dataTables/extras/swf/copy_csv_xls_pdf.swf"
    },
    dom: "<'row'<'small-4 columns'l><'small-4 columns'f><'small-4 columns'T>r>"+
      "t"+
      "<'row'<'small-6 columns'i><'small-6 columns'p>>"
  })