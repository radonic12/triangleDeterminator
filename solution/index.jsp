<html>
<head>
  <!-- Import of tradeshift UI -->
  <link rel="stylesheet" href="//d5wfroyti11sa.cloudfront.net/prod/client/ts-12.2.0.min.css"/>
  <script src="//d5wfroyti11sa.cloudfront.net/prod/client/ts-12.2.0.min.js"></script>
  <title>The Triangle Determinator</title>
  <meta name="ts-app-title" content="The Triangle Determinator"/>
  <meta name="ts-app-color" content="ts-blue"/>
  <link rel="ts-app-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Golden_Triangle.svg/220px-Golden_Triangle.svg.png"/>

  <script>
    
    // Alert for when retrieval of triangle is succesful
    function displayTriangleType(text){
      ts.ui.Notification.info('The triangle is a ' + text);
    }

    // Alert for when retrieval of triangle is unsuccesful
    function displayError(){
      ts.ui.Notification.error("Make sure you have added all sides. Use only numbers. Use . as a comma seperator");
    }
    
    // Call to the java function that determines the triangle type based on the length of three sides
    function getTriangleType(){
    let a = document.getElementById("a").value;
    let b = document.getElementById("b").value;
    let c = document.getElementById("c").value;
    const Http = new XMLHttpRequest();
    
    let url= window.location.toString();
    let lastChar = url.substr(-1);
    
    if(lastChar == "/"){
      url = url.substring(0, url.length-1);
    }
    
    url = url + '/triangleClass.jsp?a='+a+'&b='+b+'&c='+c;


    console.log(url)
    Http.open("GET", url);
    Http.send();
    
    Http.onload=function(){
    console.log(Http.responseText)
    if(this.status == 200){
      displayTriangleType(Http.responseText);
    }else{
      displayError(); 
    }
    }
    
    }
</script>

  

</head>
<body>
    

    <div data-ts="App">
        <div data-ts="Main">
          <div data-ts="Content">
            <div data-ts="Panel">

                    <!-- The form that takes the input for the triangle -->
                    <div data-ts="Note">
                    <p>Use only numbers as input and use . for seperating decimals</p>
                    </div>
                    <form data-ts="Form" style="text-align: center; margin: 0 auto; width:250px;">
                    <fieldset>
                    <label>
                    <span style="text-align: center;font-weight: bold; font-size: 100%;"> Determine my triangle </span>
                    <br>
                    
                    <input type="number" placeholder="side a" name="a" id="a"/>
                    <br>
                    <input type="number" placeholder="side b" name="b" id="b"/>
                    <br>
                    <input type="number" placeholder="side c" name="c" id="c"/>
                    <br>
                    <button data-ts="Button" class="ts-primary" onclick="getTriangleType()" >
                    <span>Determine triangle</span>
                    </button>
                    
                    
                    </label>
                    </fieldset>
                    </form>
            </div>
          </div>
        </div>
      </div>



</body>
</html>