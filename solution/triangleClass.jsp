<%!
  //The functions that determines the type of triagle
  public String determineTrinagle(double a, double b, double c){
    String triangleType;

    if(a==b && a==c && b==c){
      triangleType = "Equilateral triangle";
    }
    else if (a==b || a==c || b==c){
      triangleType = "Isosceles triangle";
    }
    else{
      triangleType = "Scalene triangle";
    }

    return triangleType;

  }

%>

<%   
  
  try{
    Double a = Double.parseDouble(request.getParameter("a"));
    Double b = Double.parseDouble(request.getParameter("b"));
    Double c = Double.parseDouble(request.getParameter("c"));
    out.print(determineTrinagle(a,b,c));
  }
  catch(Exception e) {
    //  Block of code to handle errors
    response.sendError(404, "Error! Make sure you have added all sides. Use only numbers. Use . as a comma seperator" );
  }
  


%>