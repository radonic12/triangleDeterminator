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

    return "The triangle is a " + triangleType;

  }

%>

<%   
 
  Double a = 0.0;
  Double b = 0.0;
  Double c = 0.0;

  try{
    a = Double.parseDouble(request.getParameter("a"));
    b = Double.parseDouble(request.getParameter("b"));
    c = Double.parseDouble(request.getParameter("c"));
  } catch(Exception e) {
    //Block of code to handle errors
    out.print("Missing input or wrong format! \n \n Input all three sides, use only numbers & use . as a comma seperator");
    response.setStatus(404);
    return;
  } 

  if(a <= 0 || b <= 0 || c <= 0 ){
    out.print("Your input has to be > 0");
    response.setStatus(405);
    return;
  }
  
  try{
    out.print(determineTrinagle(a,b,c));
  }catch(Exception e) {
    //  Block of code to handle errors
    out.print("The function failed. Please try again");
    response.setStatus(500);
  } 
  
  


%>