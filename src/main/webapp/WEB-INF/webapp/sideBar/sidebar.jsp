<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://www.google.com/jsapi"
        type="text/javascript"></script>
    <script type="text/javascript">
    //<!
    google.load('search', '1');

    function OnLoad() {
      // Create a search control
      var searchControl = new google.search.SearchControl();

      // Add in a full set of searchers
      var localSearch = new google.search.LocalSearch();
      searchControl.addSearcher(localSearch);
      searchControl.addSearcher(new google.search.WebSearch());
      searchControl.addSearcher(new google.search.VideoSearch());
      searchControl.addSearcher(new google.search.BlogSearch());
      searchControl.addSearcher(new google.search.NewsSearch());
      searchControl.addSearcher(new google.search.ImageSearch());
      searchControl.addSearcher(new google.search.BookSearch());
      searchControl.addSearcher(new google.search.PatentSearch());

      // Set the Local Search center point
      localSearch.setCenterPoint("New York, NY");

      // tell the searcher to draw itself and tell it where to attach
      searchControl.draw(document.getElementById("searchcontrol"));

      // execute an inital search
      searchControl.execute("");
    }
    google.setOnLoadCallback(OnLoad);

    //]]>
    </script>

</head>
<body>

<div id="searchcontrol" style="width:250px;">Loading</div>
<div id='pwidget_stage'></div><script src='http://api.newswire.co.kr/newswire_pwidget.js'></script><link href='http://api.newswire.co.kr/newswire_pwidget.css' type='text/css' rel='stylesheet'><script>get_newswire_Pubnews({apikey : '6aec73b3e6c3dd2b5385c4b3fb947c74', newspage : 1, width : '250', height : '340', boxcolor : '4661a6', titlecolor : 'ffffff', bodycolor : 'ffffff', textcolor : '999999', linkcolor : '2c4692'});</script>
<EMBED src="http://rp5.ru/informer/100x100/1/29.swf" loop=false menu=false quality=high scale=noscale wmode=transparent bgcolor=#CCCCCC flashvars="id=12514&lang=ko&um=00000" WIDTH="250" HEIGHT="250" NAME="loader" ALIGN="" TYPE="application/x-shockwave-flash" PLUGINSPAGE= "http://www.macromedia.com/go/getflashplayer"></EMBED>



</body>
</html>