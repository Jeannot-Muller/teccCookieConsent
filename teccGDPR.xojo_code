#tag Class
Protected Class teccGDPR
Inherits WebSDKUIControl
	#tag Event
		Function ExecuteEvent(name as string, parameters as JSONItem) As Boolean
		  #Pragma unused name
		  #Pragma unused parameters
		  // Events sent with TriggerServerEvent using your controlID will end up here
		End Function
	#tag EndEvent

	#tag Event
		Function HandleRequest(Request As WebRequest, Response As WebResponse) As Boolean
		  // Requests sent to the session with the following pattern
		  // 
		  // /<Session Identifier>/data/<controlID>/request_path
		  #Pragma unused Request
		  #Pragma unused Response
		  
		End Function
	#tag EndEvent

	#tag Event
		Function JavaScriptClassName() As String
		  // Name of your class which extends XojoWeb.XojoControl
		  Return "tecc.teccCSS"
		End Function
	#tag EndEvent

	#tag Event
		Sub Serialize(js as JSONItem)
		  nCalls = nCalls + 1
		  js.value("nCalls") = nCalls
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionCSSURLs(session as WebSession) As String()
		  #Pragma unused Session
		  // Return an array of CSS URLs for your control
		  // Here's one way to do this...
		  
		  If teccGDPRCSS = Nil Then
		    Var cssStr As String
		    Var css() As String
		    
		    css.add(".cookie-bubble {")
		    css.add("position: fixed;")
		    css.add("width: 100%;")
		    css.add("max-width: 400px;")
		    css.add("min-height: 100px;")
		    css.add("border-radius: 10px;")
		    css.add("background-color: #fff;")
		    css.add("-webkit-box-shadow: 0 2px 15px rgba(0, 0, 0, 0.2);")
		    css.add("box-shadow: 0 2px 15px rgba(0, 0, 0, 0.2);")
		    css.add("z-index: 9999;")
		    css.add("font-family: sans-serif;")
		    css.add("}")
		    css.add(".cookie-bubble.top-left {")
		    css.add("top: 10px;")
		    css.add("left: 10px;")
		    css.add("}")
		    css.add(".cookie-bubble.top-right {")
		    css.add("top: 10px;")
		    css.add("right: 0;")
		    css.add("}")
		    css.add(".cookie-bubble.top-center {")
		    css.add("top: 10px;")
		    css.add("left: calc(100vw - 100vw / 2 - 400px / 2);")
		    css.add("}")
		    css.add(".cookie-bubble.bottom-left {")
		    css.add("bottom: 10px;")
		    css.add("left: 10px;")
		    css.add("}")
		    css.add(".cookie-bubble.bottom-right {")
		    css.add("bottom: 10px;")
		    css.add("right: 0;")
		    css.add("}")
		    css.add(".cookie-bubble.bottom-center {")
		    css.add("bottom: 10px;")
		    css.add("left: calc(100vw - 100vw / 2 - 400px / 2);")
		    css.add("}")
		    css.add(".cookie-bubble.show.top-center,")
		    css.add(".cookie-bubble.show.top-left,")
		    css.add(".cookie-bubble.show.top-right {")
		    css.add("-webkit-animation-name: popInTop;")
		    css.add("animation-name: popInTop;")
		    css.add("-webkit-animation-duration: 2s;")
		    css.add("animation-duration: 2s;")
		    css.add("-webkit-animation-timing-function: cubic-bezier(0.19, 1, 0.22, 1);")
		    css.add("animation-timing-function: cubic-bezier(0.19, 1, 0.22, 1);")
		    css.add("-webkit-animation-fill-mode: forwards;")
		    css.add("animation-fill-mode: forwards;")
		    css.add("}")
		    css.add(".cookie-bubble.show.bottom-center,")
		    css.add(".cookie-bubble.show.bottom-left,")
		    css.add(".cookie-bubble.show.bottom-right {")
		    css.add("-webkit-animation-name: popInBottom;")
		    css.add("animation-name: popInBottom;")
		    css.add("-webkit-animation-duration: 2s;")
		    css.add("animation-duration: 2s;")
		    css.add("-webkit-animation-timing-function: cubic-bezier(0.19, 1, 0.22, 1);")
		    css.add("animation-timing-function: cubic-bezier(0.19, 1, 0.22, 1);")
		    css.add("-webkit-animation-fill-mode: forwards;")
		    css.add("animation-fill-mode: forwards;")
		    css.add("}")
		    css.add(".cookie-bubble.hide {")
		    css.add("display: none;")
		    css.add("}")
		    css.add(".cookie-bubble .cb-wrapper {")
		    css.add("position: relative;")
		    css.add("display: inline-block;")
		    css.add("padding: 15px;")
		    css.add("}")
		    css.add(".cookie-bubble .cb-wrapper .cb-row {")
		    css.add("position: relative;")
		    css.add("display: -webkit-box;")
		    css.add("display: -ms-flexbox;")
		    css.add("display: flex;")
		    css.add("text-align: left;")
		    css.add("}")
		    css.add(".cookie-bubble .cb-wrapper .cb-row .cb-row-content .message {")
		    css.add("position: relative;")
		    css.add("width: 100%;")
		    css.add("display: inline-block;")
		    css.add("color: #000;")
		    css.add("font-size: 18px;")
		    css.add("margin-top: 0;")
		    css.add("}")
		    css.add(".cookie-bubble .cb-wrapper .cb-row .cb-row-content .cb-controls {")
		    css.add("position: relative;")
		    css.add("width: 100%;")
		    css.add("float: left;")
		    css.add("margin-top: 10px;")
		    css.add("}")
		    css.add(".cookie-bubble .cb-wrapper .cb-row .cb-image {")
		    css.add("padding-right: 23px;")
		    css.add("}")
		    css.add(".cookie-bubble .cb-wrapper .cb-row .cb-image .cookie-inner-color {")
		    css.add("fill: #00a4ff;")
		    css.add("}")
		    css.add(".cookie-bubble .cb-wrapper .cb-row .cb-image svg {")
		    css.add("width: 75px;")
		    css.add("}")
		    css.add(".cookie-bubble .cb-wrapper .cb-row .agreement-btn {")
		    css.add("margin: 0 10px 0 0;")
		    css.add("text-decoration: none;")
		    css.add("color: #fff;")
		    css.add("background: #00a4ff;")
		    css.add("padding: 10px 20px;")
		    css.add("border-radius: 100px;")
		    css.add("font-size: 14px;")
		    css.add("opacity: 1;")
		    css.add("border: none;")
		    css.add("cursor: pointer;")
		    css.add("text-transform: uppercase;")
		    css.add("font-weight: 600;")
		    css.add("float: left;")
		    css.add("}")
		    css.add(".cookie-bubble .cb-wrapper .cb-row .agreement-btn:hover {")
		    css.add("background-color: #0083cc;")
		    css.add("}")
		    css.add(".cookie-bubble .cb-wrapper .cb-row .cookie-policy-btn {")
		    css.add("margin: 0;")
		    css.add("color: #000;")
		    css.add("padding: 10px 0;")
		    css.add("border-radius: 100px;")
		    css.add("font-size: 14px;")
		    css.add("opacity: 0.95;")
		    css.add("border: none;")
		    css.add("cursor: pointer;")
		    css.add("font-weight: 400;")
		    css.add("float: left;")
		    css.add("}")
		    css.add(".cookie-bubble .cb-wrapper .cb-row .cookie-policy-btn:hover {")
		    css.add("opacity: 1;")
		    css.add("text-decoration: underline;")
		    css.add("}")
		    css.add(".cookieBubble .copyright-wrapper {")
		    css.add("margin-top: 20px;")
		    css.add("}")
		    css.add(".cookieBubble .copyright-wrapper a.copyright {")
		    css.add("position: absolute;")
		    css.add("width: 80px;")
		    css.add("height: 16px;")
		    css.add("bottom: 8px;")
		    css.add("right: 7px;")
		    css.add("margin-top: 30px;")
		    css.add("background: url(../img/cb_copyright.svg);")
		    css.add("background-size: cover;")
		    css.add("}")
		    css.add("@-webkit-keyframes popInBottom {")
		    css.add("0% {")
		    css.add("-webkit-transform: translateY(120%);")
		    css.add("transform: translateY(120%);")
		    css.add("}")
		    css.add("100% {")
		    css.add("-webkit-transform: translateY(0);")
		    css.add("transform: translateY(0);")
		    css.add("}")
		    css.add("}")
		    css.add("@keyframes popInBottom {")
		    css.add("0% {")
		    css.add("-webkit-transform: translateY(120%);")
		    css.add("transform: translateY(120%);")
		    css.add("}")
		    css.add("100% {")
		    css.add("-webkit-transform: translateY(0);")
		    css.add("transform: translateY(0);")
		    css.add("}")
		    css.add("}")
		    css.add("@-webkit-keyframes popInTop {")
		    css.add("0% {")
		    css.add("-webkit-transform: translateY(-120%);")
		    css.add("transform: translateY(-120%);")
		    css.add("}")
		    css.add("100% {")
		    css.add("-webkit-transform: translateY(0);")
		    css.add("transform: translateY(0);")
		    css.add("}")
		    css.add("}")
		    css.add("@keyframes popInTop {")
		    css.add("0% {")
		    css.add("-webkit-transform: translateY(-120%);")
		    css.add("transform: translateY(-120%);")
		    css.add("}")
		    css.add("100% {")
		    css.add("-webkit-transform: translateY(0);")
		    css.add("transform: translateY(0);")
		    css.add("}")
		    css.add("}")
		    css.add("@media (max-width: 420px) {")
		    css.add(".cookieBubble {")
		    css.add("border-radius: 0;")
		    css.add("max-width: inherit;")
		    css.add("left: 0 !important;")
		    css.add("bottom: 0 !important;")
		    css.add("}")
		    css.add(".cookieBubble .cb-image {")
		    css.add("display: none;")
		    css.add("}")
		    css.add("}")
		    
		    
		    cssStr = String.FromArray( css, "" )
		    
		    teccGDPRCSS = New WebFile
		    teccGDPRCSS.Filename = "teccToggle.css"
		    teccGDPRCSS.MIMEType = "text/css"
		    teccGDPRCSS.data = cssStr
		    teccGDPRCSS.Session = Nil 
		  End If
		  
		  Var urls() As String
		  urls.Add( teccGDPRCSS.URL )
		  
		  Return urls
		End Function
	#tag EndEvent

	#tag Event
		Function SessionHead(session as WebSession) As String
		  #Pragma unused session
		  // Return anything that you needed added to the <head> of the web app
		  
		End Function
	#tag EndEvent

	#tag Event
		Function SessionJavascriptURLs(session as WebSession) As String()
		  #Pragma unused session
		  If JSFramework = Nil Then
		    JSFramework = New WebFile
		    JSFramework.Filename = "teccCSS.js"
		    JSFramework.MIMEType ="text/javascript"
		    JSFramework.data = kJSCode
		    JSFramework.Session = Nil 
		  End If
		  
		  Var urls() As String
		  urls.Add( JSFramework.URL )
		  
		  Return urls
		  
		  
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h21
		Private Shared JSFramework As WebFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private nCalls As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared teccGDPRCSS As WebFile
	#tag EndProperty


	#tag Constant, Name = kCSSCode, Type = String, Dynamic = False, Default = \".cookie-bubble{position:fixed;width:100%;max-width:400px;min-height:100px;border-radius:10px;background-color:#fff;-webkit-box-shadow:0 2px 15px rgba(0\x2C0\x2C0\x2C.2);box-shadow:0 2px 15px rgba(0\x2C0\x2C0\x2C.2);z-index:9999;font-family:sans-serif}.cookie-bubble.top-left{top:10px;left:10px}.cookie-bubble.top-right{top:10px;right:0}.cookie-bubble.top-center{top:10px;left:calc(100vw - 100vw/2 - 400px/2)}.cookie-bubble.bottom-left{bottom:10px;left:10px}.cookie-bubble.bottom-right{bottom:10px;right:0}.cookie-bubble.bottom-center{bottom:10px;left:calc(100vw - 100vw/2 - 400px/2)}.cookie-bubble.show.top-center\x2C.cookie-bubble.show.top-left\x2C.cookie-bubble.show.top-right{-webkit-animation-name:popInTop;animation-name:popInTop;-webkit-animation-duration:2s;animation-duration:2s;-webkit-animation-timing-function:cubic-bezier(.19\x2C1\x2C.22\x2C1);animation-timing-function:cubic-bezier(.19\x2C1\x2C.22\x2C1);-webkit-animation-fill-mode:forwards;animation-fill-mode:forwards}.cookie-bubble.show.bottom-center\x2C.cookie-bubble.show.bottom-left\x2C.cookie-bubble.show.bottom-right{-webkit-animation-name:popInBottom;animation-name:popInBottom;-webkit-animation-duration:2s;animation-duration:2s;-webkit-animation-timing-function:cubic-bezier(.19\x2C1\x2C.22\x2C1);animation-timing-function:cubic-bezier(.19\x2C1\x2C.22\x2C1);-webkit-animation-fill-mode:forwards;animation-fill-mode:forwards}.cookie-bubble.hide{display:none}.cookie-bubble .cb-wrapper{position:relative;display:inline-block;padding:15px}.cookie-bubble .cb-wrapper .cb-row{position:relative;display:-webkit-box;display:-ms-flexbox;display:flex;text-align:left}.cookie-bubble .cb-wrapper .cb-row .cb-row-content .message{position:relative;width:100%;display:inline-block;color:#000;font-size:18px;margin-top:0}.cookie-bubble .cb-wrapper .cb-row .cb-row-content .cb-controls{position:relative;width:100%;float:left;margin-top:10px}.cookie-bubble .cb-wrapper .cb-row .cb-image{padding-right:23px}.cookie-bubble .cb-wrapper .cb-row .cb-image .cookie-inner-color{fill:#00a4ff}.cookie-bubble .cb-wrapper .cb-row .cb-image svg{width:75px}.cookie-bubble .cb-wrapper .cb-row .agreement-btn{margin:0 10px 0 0;text-decoration:none;color:#fff;background:#00a4ff;padding:10px 20px;border-radius:100px;font-size:14px;opacity:1;border:none;cursor:pointer;text-transform:uppercase;font-weight:600;float:left}.cookie-bubble .cb-wrapper .cb-row .agreement-btn:hover{background-color:#0083cc}.cookie-bubble .cb-wrapper .cb-row .cookie-policy-btn{margin:0;color:#000;padding:10px 0;border-radius:100px;font-size:14px;opacity:.95;border:none;cursor:pointer;font-weight:400;float:left}.cookie-bubble .cb-wrapper .cb-row .cookie-policy-btn:hover{opacity:1;text-decoration:underline}.cookieBubble .copyright-wrapper{margin-top:20px}.cookieBubble .copyright-wrapper a.copyright{position:absolute;width:80px;height:16px;bottom:8px;right:7px;margin-top:30px;background:url(../img/cb_copyright.svg);background-size:cover}@-webkit-keyframes popInBottom{0%{-webkit-transform:translateY(120%);transform:translateY(120%)}100%{-webkit-transform:translateY(0);transform:translateY(0)}}@keyframes popInBottom{0%{-webkit-transform:translateY(120%);transform:translateY(120%)}100%{-webkit-transform:translateY(0);transform:translateY(0)}}@-webkit-keyframes popInTop{0%{-webkit-transform:translateY(-120%);transform:translateY(-120%)}100%{-webkit-transform:translateY(0);transform:translateY(0)}}@keyframes popInTop{0%{-webkit-transform:translateY(-120%);transform:translateY(-120%)}100%{-webkit-transform:translateY(0);transform:translateY(0)}}@media (max-width:420px){.cookieBubble{border-radius:0;max-width:inherit;left:0!important;bottom:0!important}.cookieBubble .cb-image{display:none}}", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kJSCode, Type = String, Dynamic = False, Default = \"\"use strict\";\nvar tecc;\n(function (tecc) {\n    class teccCSS extends XojoWeb.XojoVisualControl {\n        constructor(id\x2C events) {\n            super(id\x2C events);\n        }\n\n     render() {\n            super.render();\n            let el \x3D this.DOMElement();\n            if (!el)\n                return;\n            this.setAttributes(el);\n            var idstr \x3D el.id + \"_teccCSS\";\n            let btn \x3D document.createElement(\"div\");\n            $.cookieBubble();\n\t   debugger;\n            this.replaceEveryChild(btn);\n            this.applyTooltip(el);\n            this.applyUserStyle(el);\n        }\n\n        updateControl(data) {\n            super.updateControl(data);\n            let js \x3D $.parseJSON(data);\n            this.refresh;\n            this.nCalls \x3D js.nCalls;\n          }\n      }\n    tecc.teccCSS \x3D teccCSS;\n})(tecc || (tecc \x3D {}));\n\n!(function (r) {\n    r.cookieBubble \x3D function (o) {\n        var e \x3D \"cookieBubble\"\x2C\n            t \x3D !1\x2C\n            i \x3D !0\x2C\n            n \x3D r.extend(\n                {\n                    cookieMaxAge: 30\x2C\n                    messageText: \"We use cookies to personalize your experience. By continuing to visit this website you agree to our use of cookies.\"\x2C\n                    messageTextColor: void 0\x2C\n                    messageFontSize: void 0\x2C\n                    buttonText: \"Got it\"\x2C\n                    buttonColor: void 0\x2C\n                    buttonFontSize: void 0\x2C\n                    iconColor: void 0\x2C\n                    iconVisibility: !0\x2C\n                    cookiePolicyButtonText: \"Read Our Cookie Policy\"\x2C\n                    cookiePolicyButtonTextColor: void 0\x2C\n                    cookiePolicyButtonUrl: \"http://allaboutcookies.org/\"\x2C\n                    cookiePolicyButtonTarget: \"_blank\"\x2C\n                    boxAppearDelay: 1e3\x2C\n                }\x2C\n                o\n            )\x2C\n            a \x3D t \? \"show\" : \"hide\"\x2C\n            c \x3D n.iconVisibility\n                \? \'<div class\x3D\"cb-image\"><svg xmlns\x3D\"http://www.w3.org/2000/svg\" viewBox\x3D\"0 0 97.93 97.93\"><defs><style>.cookie-inner-color{fill:\' +\n                  n.iconColor +\n                  \'!important}</style></defs><g id\x3D\"Layer_2\" data-name\x3D\"Layer 2\"><g id\x3D\"Layer_1-2\" data-name\x3D\"Layer 1\"><path d\x3D\"M44\x2C23.76a2.47\x2C2.47\x2C0\x2C1\x2C0\x2C.91\x2C3.37A2.47\x2C2.47\x2C0\x2C0\x2C0\x2C44\x2C23.76Z\"/><path d\x3D\"M25.9\x2C40.32a2.47\x2C2.47\x2C0\x2C0\x2C0\x2C0\x2C4.93h0a2.47\x2C2.47\x2C0\x2C1\x2C0\x2C0-4.93Z\"/><circle cx\x3D\"32.08\" cy\x3D\"65.86\" r\x3D\"2.47\"/><path d\x3D\"M56.38\x2C69.91a2.47\x2C2.47\x2C0\x2C1\x2C0\x2C1.14\x2C1.49A2.47\x2C2.47\x2C0\x2C0\x2C0\x2C56.38\x2C69.91Z\"/><path d\x3D\"M72\x2C52.68a2.47\x2C2.47\x2C0\x2C0\x2C0-2.38\x2C1.83\x2C2.44\x2C2.44\x2C0\x2C0\x2C0\x2C.25\x2C1.87\x2C2.47\x2C2.47\x2C0\x2C0\x2C0\x2C4.52-.59\x2C2.44\x2C2.44\x2C0\x2C0\x2C0-.25-1.87A2.47\x2C2.47\x2C0\x2C0\x2C0\x2C72\x2C52.68Z\"/><path class\x3D\"cookie-inner-color\" d\x3D\"M89.51\x2C52.86A14\x2C14\x2C0\x2C0\x2C1\x2C81\x2C47.2\x2C14.09\x2C14.09\x2C0\x2C0\x2C1\x2C61\x2C35.68\x2C14.09\x2C14.09\x2C0\x2C0\x2C1\x2C49.49\x2C15.73a14\x2C14\x2C0\x2C0\x2C1-5.66-8.55\x2C44\x2C44\x2C0\x2C0\x2C0-21.09\x2C6.15A44.26\x2C44.26\x2C0\x2C0\x2C0\x2C71.46\x2C87.08\x2C44.24\x2C44.24\x2C0\x2C0\x2C0\x2C89.51\x2C52.86ZM28.28\x2C43.42a2.47\x2C2.47\x2C0\x2C0\x2C1-2.38\x2C1.83h0a2.47\x2C2.47\x2C0\x2C1\x2C1\x2C2.38-1.83Zm3.8\x2C24.9a2.47\x2C2.47\x2C0\x2C1\x2C1\x2C2.47-2.47A2.47\x2C2.47\x2C0\x2C0\x2C1\x2C32.08\x2C68.32ZM44.92\x2C27.13A2.47\x2C2.47\x2C0\x2C1\x2C1\x2C44\x2C23.76\x2C2.47\x2C2.47\x2C0\x2C0\x2C1\x2C44.92\x2C27.13ZM57.28\x2C73.27a2.47\x2C2.47\x2C0\x2C1\x2C1-.9-3.36\x2C2.47\x2C2.47\x2C0\x2C0\x2C1\x2C.9\x2C3.36ZM74.42\x2C55.79a2.47\x2C2.47\x2C0\x2C1\x2C1-.25-1.87A2.45\x2C2.45\x2C0\x2C0\x2C1\x2C74.42\x2C55.79Z\"/><path d\x3D\"M97.93\x2C48.52v-.2A2.35\x2C2.35\x2C0\x2C0\x2C0\x2C95.7\x2C46a9.37\x2C9.37\x2C0\x2C0\x2C1-8-5.45\x2C2.35\x2C2.35\x2C0\x2C0\x2C0-3.49-.93\x2C9.51\x2C9.51\x2C0\x2C0\x2C1-5.44\x2C1.72A9.4\x2C9.4\x2C0\x2C0\x2C1\x2C69.39\x2C31.1a2.35\x2C2.35\x2C0\x2C0\x2C0-2.55-2.55c-.28\x2C0-.57\x2C0-.85\x2C0a9.39\x2C9.39\x2C0\x2C0\x2C1-7.68-14.81\x2C2.35\x2C2.35\x2C0\x2C0\x2C0-.93-3.49\x2C9.37\x2C9.37\x2C0\x2C0\x2C1-5.45-8A2.35\x2C2.35\x2C0\x2C0\x2C0\x2C49.61\x2C0H49a49\x2C49\x2C0\x2C1\x2C0\x2C49\x2C49C97.93\x2C48.82\x2C97.93\x2C48.67\x2C97.93\x2C48.52ZM71.46\x2C87.08A44.26\x2C44.26\x2C0\x2C0\x2C1\x2C22.74\x2C13.33\x2C44\x2C44\x2C0\x2C0\x2C1\x2C47.53\x2C4.72a14\x2C14\x2C0\x2C0\x2C0\x2C5.66\x2C8.55A14.09\x2C14.09\x2C0\x2C0\x2C0\x2C64.71\x2C33.22\x2C14.09\x2C14.09\x2C0\x2C0\x2C0\x2C84.66\x2C44.75a14\x2C14\x2C0\x2C0\x2C0\x2C8.56\x2C5.66A44.3\x2C44.3\x2C0\x2C0\x2C1\x2C71.46\x2C87.08Z\"/></g></g></svg></div>\'\n                : \"\"\x2C\n            s \x3D (\"_blank\" \x3D\x3D\x3D n.cookiePolicyButtonTarget || n.cookiePolicyButtonTarget\x2C n.cookiePolicyButtonTarget)\x2C\n            l \x3D {\n                init: function () {\n                    l.body()\x2C l.painter()\x2C l.checkCookie();\n                }\x2C\n                body: function () {\n                    r(\"body\").append(\n                        \'<div class\x3D\"cookie-bubble \' +\n                            a +\n                            \' bottom-left\"><div class\x3D \"cb-wrapper\"><div class\x3D\"cb-row\">\' +\n                            c +\n                            \'<div class\x3D\"cb-row-content\"><span class\x3D\"message\">\' +\n                            n.messageText +\n                            \'</span><div class\x3D\"cb-controls\"><button class\x3D\"agreement-btn\">\' +\n                            n.buttonText +\n                            \'</button><a class\x3D\"cookie-policy-btn\" href\x3D\' +\n                            n.cookiePolicyButtonUrl +\n                            \" target\x3D\" +\n                            s +\n                            \">\" +\n                            n.cookiePolicyButtonText +\n                            \"</a></div></div></div ></div >\"\n                    );\n                }\x2C\n                painter: function () {\n                    var o \x3D r(\".cookie-bubble .cb-message span\")\x2C\n                        e \x3D r(\".cookie-bubble .agreement-btn\")\x2C\n                        t \x3D r(\".cookie-bubble .cookie-policy-btn\")\x2C\n                        i \x3D { color: n.messageTextColor\x2C \"font-size\": n.messageFontSize }\x2C\n                        a \x3D { \"background-color\": n.buttonColor\x2C \"font-size\": n.buttonFontSize }\x2C\n                        c \x3D { color: n.cookiePolicyButtonTextColor };\n                    o.css(i)\x2C e.css(a)\x2C t.css(c);\n                }\x2C\n                setCookie: function (o\x2C e\x2C t) {\n                    var i \x3D new Date();\n                    i.setTime(i.getTime() + 24 * t * 60 * 60 * 1e3);\n                    var a \x3D \"expires\x3D\" + i.toGMTString();\n                    document.cookie \x3D o + \"\x3D\" + e + \";\" + a + \";path\x3D/\";\n                }\x2C\n                getCookie: function (o) {\n                    for (var e \x3D o + \"\x3D\"\x2C t \x3D decodeURIComponent(document.cookie).split(\";\")\x2C i \x3D 0; i < t.length; i++) {\n                        for (var a \x3D t[i]; \" \" \x3D\x3D a.charAt(0); ) a \x3D a.substring(1);\n                        if (0 \x3D\x3D a.indexOf(e)) return a.substring(e.length\x2C a.length);\n                    }\n                    return \"\";\n                }\x2C\n                checkCookie: function () {\n                    var o \x3D l.getCookie(e);\n                    \"\" !\x3D o && null !\x3D o\n                        \? r(\".cookie-bubble\").removeClass(\"show\").addClass(\"hide\")\n                        : (setTimeout(function () {\n                              r(\".cookie-bubble\").removeClass(\"hide\").addClass(\"show\");\n                          }\x2C n.boxAppearDelay)\x2C\n                          r(\".cookie-bubble .agreement-btn\").click(function (o) {\n                              l.setCookie(e\x2C i\x2C n.cookieMaxAge)\x2C r(\".cookie-bubble\").removeClass(\"show\").addClass(\"hide\");\n                          }));\n                }\x2C\n            };\n        l.init();\n    };\n})(jQuery);\n", Scope = Private
	#tag EndConstant

	#tag Constant, Name = LibraryIcon, Type = String, Dynamic = False, Default = \"", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NavigatorIcon, Type = String, Dynamic = False, Default = \"iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABemlDQ1BJQ0MgUHJvZmlsZQAAKJF9kE0rRFEYx39miLzNgoWFxY1hY4hRYqPMJNQsNCiDzZ1rXtTMuN25QjYWynaKEhtvCz4BGwtlrZQiJTtfgNhI13NmaLyUp57z/M5znvPvnD+4fLpppko7IZ2xrfBQQJuMTGnlj5TRiIda2nQjaw6MjoaQ+Ko/4/WGElWv25XW3/N/o2o2ljWgpEK43zAtW3hYuHnRNhUrvXpLHiW8qjhR4E3F0QIf52fGw0HhM2HNSOqzwvfCPiNppcGl9L3RbzOJb5xOLRif71E/qY5lJsakNkk2kiXMEAE0RhgkSA9d9MnaQzt+OmSHHVuy1eXgvLlszSWStjYgTsS0kYzR4dP8nX6ZUb7+9qvYm9+D3hdw54q96BacrkPDXbHn3QXPGpxcmLql51tuSVc8Dk9HUBOBuiuonM7Gu/2FH1UHoOzBcZ5boHwD3nOO87bvOO8Hclk8Os8UPPrU4vAWxlcgdAnbO9Aq2p6ZDyszZzCPSKziAAAAbGVYSWZNTQAqAAAACAAEARoABQAAAAEAAAA+ARsABQAAAAEAAABGASgAAwAAAAEAAgAAh2kABAAAAAEAAABOAAAAAAAAAGAAAAABAAAAYAAAAAEAAqACAAQAAAABAAAAEKADAAQAAAABAAAAEAAAAADImMOoAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAA3ElEQVQ4Ec2TPQrCQBCFVwUvYWthL2ihpVgL2trZ2nsBGyuxtlBvYGXvBTyB9jYJ/iP4900IYbIoxLVx4YO3O/PeTkJijDFZGIEHz4RIr3jEG4ikRrtPQr662Q7wUgTIofNKOztD47uAG7WjCj4ofUbf1T6Q+rkWnFShCWtoQAuWMIUa9EF7YpsSxb1qqKAnIFMNoANb+BhQpKgDduy7MIQHzEFCowD7HfQo1kHG3kAbVpAHmWAGBYitKI1T0Vc4KX0JtdRkolj/f3wHPmO5Lj+DMwdlx4Sx+H76nV8sE3ug9JK8jwAAAABJRU5ErkJggg\x3D\x3D", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="34"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Visual Controls"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Visual Controls"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indicator"
			Visible=true
			Group="Visual Controls"
			InitialValue=""
			Type="WebUIControl.Indicators"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Primary"
				"2 - Secondary"
				"3 - Success"
				"4 - Danger"
				"5 - Warning"
				"6 - Info"
				"7 - Light"
				"8 - Dark"
				"9 - Link"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="enabled"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
