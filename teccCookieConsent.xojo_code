#tag Class
Protected Class teccCookieConsent
Inherits WebSDKControl
	#tag Event
		Function ExecuteEvent(name as string, parameters as JSONItem) As Boolean
		  #Pragma unused name
		  #Pragma unused parameters
		  // Events sent with TriggerServerEvent using your controlID will end up here
		  
		  Try
		    
		    Select Case Name
		    Case "PolicyClicked"
		      PolicyClicked()
		      Return True
		      
		    End Select
		    
		  Catch
		    
		  End Try
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
		  Return "tecc.teccCookieConsent"
		End Function
	#tag EndEvent

	#tag Event
		Sub Serialize(js as JSONItem)
		  Var PolicyURLHandlerStr As String = "Xojo"
		  
		  Select Case PolicyURLHandler
		  Case PolicyURLHandlers.XojoEvent
		    PolicyURLHandlerStr = "Xojo"
		  Case PolicyURLHandlers.BrowserLink
		    PolicyURLHandlerStr = "Link"
		  End Select
		  
		  Var boxPositionStr As String = "bottom-left"
		  Select Case BoxPosition
		  Case boxpositions.bottom_left
		    boxPositionStr = " bottom-left"
		  Case boxPositions.bottom_center
		    boxPositionStr = " bottom-center"
		  Case boxPositions.bottom_right
		    boxPositionStr = " bottom-right"
		  Case boxpositions.top_left
		    boxPositionStr = " top-left"
		  Case boxPositions.top_center
		    boxPositionStr = " top-center"
		  Case boxPositions.top_right
		    boxPositionStr = " top-right"
		  End Select
		  
		  Var PolicyButtonTargetStr As String = "_blank"
		  Select Case PolicyButtonTarget
		  Case PolicyButtonTargets.NewPage
		    PolicyButtonTargetStr = "_blank"
		  Case PolicyButtonTargets.SamePage
		    PolicyButtonTargetStr = "_self"
		  End Select
		  
		  Var cssStr As String
		  Var css() As String
		  
		  css.add(".cookie-bubble {")
		  css.add("position: fixed;")
		  css.add("width: 100%;")
		  css.add("max-width: 400px;")
		  css.add("min-height: 100px;")
		  css.add("border-radius: 10px;")
		  css.add("background-color: #fff;")
		  css.add("-webkit-box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.2);")
		  css.add("box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.2);")
		  css.add("z-index: 9999;")
		  css.add("font-family: sans-serif; }")
		  css.add(".cookie-bubble.top-left {")
		  css.add("top: 10px;")
		  css.add("left: 10px; }")
		  css.add(".cookie-bubble.top-right {")
		  css.add("top: 10px;")
		  css.add("right: 0px; }")
		  css.add(".cookie-bubble.top-center {")
		  css.add("top: 10px;")
		  css.add("left: calc(100vw - 100vw/2 - 400px/2); }")
		  css.add(".cookie-bubble.bottom-left {")
		  css.add("bottom: 10px;")
		  css.add("left: 10px; }")
		  css.add(".cookie-bubble.bottom-right {")
		  css.add("bottom: 10px;")
		  css.add("right: 0px; }")
		  css.add(".cookie-bubble.bottom-center {")
		  css.add("bottom: 10px;")
		  css.add("left: calc(100vw - 100vw/2 - 400px/2); }")
		  css.add(".cookie-bubble.show.top-left, .cookie-bubble.show.top-center, .cookie-bubble.show.top-right {")
		  css.add("-webkit-animation-name: popInTop;")
		  css.add("animation-name: popInTop;")
		  css.add("-webkit-animation-duration: 2s;")
		  css.add("animation-duration: 2s;")
		  css.add("-webkit-animation-timing-function: cubic-bezier(0.19, 1, 0.22, 1);")
		  css.add("animation-timing-function: cubic-bezier(0.19, 1, 0.22, 1);")
		  css.add("-webkit-animation-fill-mode: forwards;")
		  css.add("animation-fill-mode: forwards; }")
		  css.add(".cookie-bubble.show.bottom-left, .cookie-bubble.show.bottom-center, .cookie-bubble.show.bottom-right {")
		  css.add("-webkit-animation-name: popInBottom;")
		  css.add("animation-name: popInBottom;")
		  css.add("-webkit-animation-duration: 2s;")
		  css.add("animation-duration: 2s;")
		  css.add("-webkit-animation-timing-function: cubic-bezier(0.19, 1, 0.22, 1);")
		  css.add("animation-timing-function: cubic-bezier(0.19, 1, 0.22, 1);")
		  css.add("-webkit-animation-fill-mode: forwards;")
		  css.add("animation-fill-mode: forwards; }")
		  css.add(".cookie-bubble.hide {")
		  css.add("display: none; }")
		  css.add(".cookie-bubble .cb-wrapper {")
		  css.add("position: relative;")
		  css.add("display: inline-block;")
		  css.add("padding: 15px; }")
		  css.add(".cookie-bubble .cb-wrapper .cb-row {")
		  css.add("position: relative;")
		  css.add("display: -webkit-box;")
		  css.add("display: -ms-flexbox;")
		  css.add("display: flex;")
		  css.add("text-align: left; }")
		  css.add(".cookie-bubble .cb-wrapper .cb-row .cb-row-content .message {")
		  css.add("position: relative;")
		  css.add("width: 100%;")
		  css.add("display: inline-block;")
		  css.add("color: #000000;")
		  css.add("font-size: 18px;")
		  css.add("margin-top: 0px; }")
		  css.add(".cookie-bubble .cb-wrapper .cb-row .cb-row-content .cb-controls {")
		  css.add("position: relative;")
		  css.add("width: 100%;")
		  css.add("float: left;")
		  css.add("margin-top: 10px; }")
		  css.add(".cookie-bubble .cb-wrapper .cb-row .cb-image {")
		  css.add("padding-right: 23px; }")
		  css.add(".cookie-bubble .cb-wrapper .cb-row .cb-image .cookie-inner-color {")
		  css.add("fill: #00a4ff; }")
		  css.add(".cookie-bubble .cb-wrapper .cb-row .cb-image svg {")
		  css.add("width: 75px; }")
		  css.add(".cookie-bubble .cb-wrapper .cb-row .agreement-btn {")
		  css.add("margin: 0px;")
		  css.add("padding: 0px;")
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
		  css.add("margin-right: 10px; }")
		  css.add(".cookie-bubble .cb-wrapper .cb-row .agreement-btn:hover {")
		  css.add("background-color: #0083cc; }")
		  css.add(".cookie-bubble .cb-wrapper .cb-row .cookie-policy-btn {")
		  css.add("margin: 0px;")
		  css.add("color: #000;")
		  css.add("padding: 10px 0px;")
		  css.add("border-radius: 100px;")
		  css.add("font-size: 14px;")
		  css.add("opacity: .95;")
		  css.add("border: none;")
		  css.add("cursor: pointer;")
		  css.add("font-weight: 400;")
		  css.add("float: left; }")
		  css.add(".cookie-bubble .cb-wrapper .cb-row .cookie-policy-btn:hover {")
		  css.add("opacity: 1;")
		  css.add("text-decoration: underline; }")
		  css.add(".cookieBubble .copyright-wrapper {")
		  css.add("margin-top: 20px; }")
		  css.add(".cookieBubble .copyright-wrapper a.copyright {")
		  css.add("position: absolute;")
		  css.add("width: 80px;")
		  css.add("height: 16px;")
		  css.add("bottom: 8px;")
		  css.add("right: 7px;")
		  css.add("margin-top: 30px;")
		  css.add("background-size: cover; }")
		  css.add("@-webkit-keyframes popInBottom {")
		  css.add("0% {")
		  css.add("-webkit-transform: translateY(120%);")
		  css.add("transform: translateY(120%); }")
		  css.add("100% {")
		  css.add("-webkit-transform: translateY(0px);")
		  css.add("transform: translateY(0px); } }")
		  css.add("@keyframes popInBottom {")
		  css.add("0% {")
		  css.add("-webkit-transform: translateY(120%);")
		  css.add("transform: translateY(120%); }")
		  css.add("100% {")
		  css.add("-webkit-transform: translateY(0px);")
		  css.add("transform: translateY(0px); } }")
		  css.add("@-webkit-keyframes popInTop {")
		  css.add("0% {")
		  css.add("-webkit-transform: translateY(-120%);")
		  css.add("transform: translateY(-120%); }")
		  css.add("100% {")
		  css.add("-webkit-transform: translateY(0px);")
		  css.add("transform: translateY(0px); } }")
		  css.add("@keyframes popInTop {")
		  css.add("0% {")
		  css.add("-webkit-transform: translateY(-120%);")
		  css.add("transform: translateY(-120%); }")
		  css.add("100% {")
		  css.add("-webkit-transform: translateY(0px);")
		  css.add("transform: translateY(0px); } }")
		  css.add("@media (max-width: 420px) {")
		  css.add(".cookieBubble {")
		  css.add("border-radius: 0px;")
		  css.add("max-width: inherit;")
		  css.add("left: 0px !important;")
		  css.add("bottom: 0px !important; } }")
		  css.add("@media (max-width: 420px) {")
		  css.add(".cookieBubble .cb-image {")
		  css.add("display: none; } }")
		  
		  cssStr = String.FromArray( css, "" )
		  
		  js.value("enabled") = Me.Enabled
		  js.value("teccCookieConsentCSS") = cssStr
		  js.value("messageText") = messageText
		  js.value("messageTextColor") = "#" + messageTextColor.ToString.Right(6)
		  js.value("buttonText") = buttonText
		  js.value("cookiePolicyButtonText") = PolicyButtonText 
		  js.value("cookiePolicyButtonUrl") = PolicyButtonURL
		  js.value("messageFontSize") = MessageFontSize
		  js.value("boxAppearDelay") = BoxAppearDelay
		  js.value("buttonColor") =  "#" + ButtonColor.ToString.Right(6)
		  js.value("buttonFontSize") =  ButtonFontSize 
		  js.value("iconColor") =  "#" + iconColor.ToString.Right(6)
		  js.value("iconVisibility") = iconVisibility
		  js.value("cookiePolicyButtonTextColor") = "#" + PolicyButtonTextColor.ToString.Right(6)
		  js.value("boxPosition") = boxPositionStr
		  js.value("policyButtonTarget") = PolicyButtonTargetStr
		  js.value("showPolicy") = PolicyButtonShow
		  js.value("linkHandler") = PolicyURLHandlerStr
		  js.value("cookieMaxAge") = OwnCookieMaxAgeDays
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionHead(session as WebSession) As String
		  #Pragma unused session
		  // Return anything that you needed added to the <head> of the web app
		  Return "<style id ='teccCookieConsentinject'></style>"
		End Function
	#tag EndEvent

	#tag Event
		Function SessionJavascriptURLs(session as WebSession) As String()
		  #Pragma unused session
		  If JSFramework = Nil Then
		    JSFramework = New WebFile
		    JSFramework.Filename = "teccCookieConsent.js"
		    JSFramework.MIMEType ="text/javascript"
		    JSFramework.data = kJSCode
		    JSFramework.Session = Nil 
		  End If
		  
		  Var urls() As String
		  urls.Add( JSFramework.URL )
		  
		  Return urls
		  
		  
		  
		End Function
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event PolicyClicked()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mBoxAppearDelay
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBoxAppearDelay = value
			  UpdateControl
			End Set
		#tag EndSetter
		BoxAppearDelay As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mBoxPosition
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBoxPosition = value
			  UpdateControl
			End Set
		#tag EndSetter
		BoxPosition As boxPositions
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mButtonColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mButtonColor = value
			  UpdateControl
			End Set
		#tag EndSetter
		ButtonColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mButtonFontSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mButtonFontSize = value
			  UpdateControl
			End Set
		#tag EndSetter
		ButtonFontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mButtonText
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mButtonText = value
			  UpdateControl
			End Set
		#tag EndSetter
		ButtonText As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return miconColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  miconColor = value
			  UpdateControl
			End Set
		#tag EndSetter
		IconColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return miconVisibility
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  miconVisibility = value
			  UpdateControl
			End Set
		#tag EndSetter
		IconVisibility As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared JSFramework As WebFile
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBoxAppearDelay As Integer = 1000
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBoxPosition As boxPositions
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mButtonColor As Color = &c0096FF
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mButtonFontSize As Integer = 18
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mButtonText As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCookieMaxAge As Integer = 30
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mMessageFontSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMessageFontSize = value
			  UpdateControl
			End Set
		#tag EndSetter
		MessageFontSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mMessageText
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMessageText = value
			  UpdateControl
			End Set
		#tag EndSetter
		MessageText As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mMessageTextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMessageTextColor = value
			  UpdateControl
			End Set
		#tag EndSetter
		MessageTextColor As color
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private miconColor As Color = &c935100
	#tag EndProperty

	#tag Property, Flags = &h21
		Private miconVisibility As boolean = true
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMessageFontSize As Integer = 18
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMessageText As string = "We use cookies to personalize your experience. By continuing to visit this website you agree to our use of cookies."
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMessageTextColor As color = &c424242
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwnCookieMaxAgeDays As Integer = 30
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPolicyButtonShow As boolean = true
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPolicyButtonTarget As PolicyButtonTargets
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPolicyButtonText As String = "OK"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPolicyButtonTextColor As Color = &c797979
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPolicyButtonURL As string = "https://blog.xojodocs.com"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPolicyURLHandler As PolicyURLHandlers
	#tag EndProperty

	#tag Property, Flags = &h21
		Private nCalls As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mOwnCookieMaxAgeDays
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mOwnCookieMaxAgeDays = value
			  UpdateControl
			End Set
		#tag EndSetter
		OwnCookieMaxAgeDays As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPolicyButtonShow
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPolicyButtonShow = value
			  UpdateControl
			End Set
		#tag EndSetter
		PolicyButtonShow As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPolicyButtonTarget
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPolicyButtonTarget = value
			  UpdateControl
			End Set
		#tag EndSetter
		PolicyButtonTarget As PolicyButtonTargets
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPolicyButtonText
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPolicyButtonText = value
			  UpdateControl
			End Set
		#tag EndSetter
		PolicyButtonText As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPolicyButtonTextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPolicyButtonTextColor = value
			  updateControl
			End Set
		#tag EndSetter
		PolicyButtonTextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPolicyButtonURL
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPolicyButtonURL = value
			  UpdateControl
			End Set
		#tag EndSetter
		PolicyButtonURL As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPolicyURLHandler
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPolicyURLHandler = value
			  UpdateControl
			End Set
		#tag EndSetter
		PolicyURLHandler As PolicyURLHandlers
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared teccCookieConsentCSS As WebFile
	#tag EndProperty


	#tag Constant, Name = kJSCode, Type = String, Dynamic = False, Default = \"\"use strict\";\nvar tecc;\n(function (tecc) {\n    class teccCookieConsent extends XojoWeb.XojoControl {\n        constructor(id\x2C events) {\n            super(id\x2C events);\n        }\n        \n        xojoPolicyClicked() {\n          window.mytrigger.triggerServerEvent(\'PolicyClicked\'\x2C  null\x2C true);\n        }\n\n        updateControl(data) {\n            super.updateControl(data);\n            let js \x3D $.parseJSON(data);\n            this.enabled \x3D js.enabled;\n            if ( this.enabled \x3D\x3D false ) {\n             return;\n            }\n            this.teccCookieConsentCSS \x3D js.teccCookieConsentCSS;\n            this.messageText \x3D js.messageText;\n            this.messageTextColor \x3D js.messageTextColor;\n\t    this.messageFontSize \x3D js.messageFontSize;\t\t\t\t \n            this.buttonText \x3D js.buttonText;\n            this.buttonColor \x3D js.buttonColor;\t  \t\t\t\t\n\t    this.buttonFontSize \x3D js.buttonFontSize;\t\n            this.cookiePolicyButtonText \x3D js.cookiePolicyButtonText;\n            this.cookiePolicyButtonTextColor \x3D js.cookiePolicyButtonTextColor;\n            this.cookiePolicyButtonUrl \x3D js.cookiePolicyButtonUrl;\n            this.iconColor \x3D js.iconColor\x2C \n            this.iconVisibility \x3D js.iconVisibility; \t\n            this.boxAppearDelay \x3D js.boxAppearDelay;\n            this.policyButtonTarget \x3D js.policyButtonTarget;\n            this.boxPosition \x3D js.boxPosition;\n            this.showPolicy \x3D js.showPolicy;\n            this.linkHandler \x3D js.linkHandler;\n            this.cookieMaxAge \x3D js.cookieMaxAge;\n            window.mytrigger \x3D this;\n            var element \x3D document.getElementById(\'teccCookieConsentinject\');\n            if ( element !\x3D null) {\n            element.innerHTML\x3D this.teccCookieConsentCSS;\n            }\n            $.cookieBubble( {\n                cookieMaxAge: this.cookieMaxAge\x2C \n             \tmessageText: this.messageText\x2C\n                messageTextColor: this.messageTextColor\x2C\n                messageFontSize: this.messageFontSize\x2C\n                buttonText: this.buttonText\x2C\n                buttonColor: this.buttonColor\x2C\n                buttonFontSize: this.buttonFontSize\x2C\n                iconColor: this.iconColor\x2C\n                iconVisibility: this.iconVisibility\x2C\n                cookiePolicyButtonText: this.cookiePolicyButtonText\x2C\n                cookiePolicyButtonTextColor: this.cookiePolicyButtonTextColor\x2C\n                cookiePolicyButtonUrl: this.cookiePolicyButtonUrl\x2C      \n                cookiePolicyButtonTarget: this.policyButtonTarget\x2C\n                boxAppearDelay: this.boxAppearDelay\x2C\n                boxPosition: this.boxPosition\x2C\n                showPolicy: this.showPolicy\x2C\n                teccCaller: this\x2C\n                linkHandler: this.linkHandler\n            });\n          }\n      }\n    tecc.teccCookieConsent \x3D teccCookieConsent;\n})(tecc || (tecc \x3D {}));\n\n/****************************************\n * teccCookieConsent for Xojo Web 2 Version1.0\n * author: Dr. Jeannot Muller\n * Based on (correction of errors and adaption for Xojo Web 2):\n * \n * \n * cookieBubble.js: Version 1.1.4\n * author: Jo\xC3\xA3o Pereira\n * website: http://joaopereira.pt\n * email: joaopereirawd@gmail.com\n * Licensed MIT \n*****************************************/\n\n\n(function ($) {\n\n\t$.cookieBubble \x3D function (options) {\n\t\t\tvar private_opt \x3D {\n\t\t\t\tcookieName: \'cookieBubble\'\x2C\n\t\t\t\tisVisible: false\x2C\n\t\t\t\tcookieValue: true\n\t\t\t}\n\t\t\t//extended opts\n\t\t\tvar settings \x3D $.extend({\t\n\t\t\t\tcookieMaxAge  \t\t\t\t\t\t: 30\x2C \n\t\t\t\tmessageText\t\t\t\t\t\t\t: \'We use cookies to personalize your experience. By continuing to visit this website you agree to our use of cookies.\'\x2C \n\t\t\t\tmessageTextColor\t\t\t\t\t\t: undefined\x2C        \n\t\t\t\tmessageFontSize\t\t\t\t\t\t: undefined\x2C\t\t\t\t \n\t\t\t\tbuttonText \t\t\t\t\t\t\t: \'Got it\'\x2C   \n\t\t\t\tbuttonColor\t\t\t\t\t\t\t: undefined\x2C   \t\t\t\t\n\t\t\t\tbuttonFontSize\t\t\t\t\t\t: undefined\x2C\t\t\t\t  \n\t\t\t\ticonColor\t\t\t\t\t\t\t: undefined\x2C    \t\t\t \n\t\t\t\ticonVisibility\t\t  \t\t\t\t\t: true\x2C \t\t              \n\t\t\t\tcookiePolicyButtonText\t\t\t\t: \'Read Our Cookie Policy\'\x2C\n\t\t\t\tcookiePolicyButtonTextColor\t\t    \t: undefined\x2C\n\t\t\t\tcookiePolicyButtonUrl\t\t\t\t\t: \'http://allaboutcookies.org/\'\x2C\n\t\t\t\tcookiePolicyButtonTarget\t\t\t\t: \'_blank\'\x2C\n\t\t\t\tboxAppearDelay\t\t\t\t\t\t: 1000\x2C\n                               boxPosition   \t\t\t\t\t\t\t: undefined\x2C\n                               showPolicy\t\t\t\t\t\t\t: true\x2C\n                               teccCaller\t\t\t\t\t\t\t: undefined\x2C\n                               linkHandler\t\t\t\t\t\t\t: undefined\n\t\t\t}\x2C options);\n\n\t\t\tvar box_visibility \x3D private_opt.isVisible \? \'show\' : \'hide\';\n\t\tvar box_iconVisibility \x3D settings.iconVisibility \? \'<div class\x3D\"cb-image\"><svg xmlns\x3D\"http://www.w3.org/2000/svg\" viewBox\x3D\"0 0 97.93 97.93\"><defs><style>.cookie-inner-color{fill:\' + settings.iconColor + \'!important\' + \'}</style></defs><g id\x3D\"Layer_2\" data-name\x3D\"Layer 2\"><g id\x3D\"Layer_1-2\" data-name\x3D\"Layer 1\"><path d\x3D\"M44\x2C23.76a2.47\x2C2.47\x2C0\x2C1\x2C0\x2C.91\x2C3.37A2.47\x2C2.47\x2C0\x2C0\x2C0\x2C44\x2C23.76Z\"/><path d\x3D\"M25.9\x2C40.32a2.47\x2C2.47\x2C0\x2C0\x2C0\x2C0\x2C4.93h0a2.47\x2C2.47\x2C0\x2C1\x2C0\x2C0-4.93Z\"/><circle cx\x3D\"32.08\" cy\x3D\"65.86\" r\x3D\"2.47\"/><path d\x3D\"M56.38\x2C69.91a2.47\x2C2.47\x2C0\x2C1\x2C0\x2C1.14\x2C1.49A2.47\x2C2.47\x2C0\x2C0\x2C0\x2C56.38\x2C69.91Z\"/><path d\x3D\"M72\x2C52.68a2.47\x2C2.47\x2C0\x2C0\x2C0-2.38\x2C1.83\x2C2.44\x2C2.44\x2C0\x2C0\x2C0\x2C.25\x2C1.87\x2C2.47\x2C2.47\x2C0\x2C0\x2C0\x2C4.52-.59\x2C2.44\x2C2.44\x2C0\x2C0\x2C0-.25-1.87A2.47\x2C2.47\x2C0\x2C0\x2C0\x2C72\x2C52.68Z\"/><path class\x3D\"cookie-inner-color\" d\x3D\"M89.51\x2C52.86A14\x2C14\x2C0\x2C0\x2C1\x2C81\x2C47.2\x2C14.09\x2C14.09\x2C0\x2C0\x2C1\x2C61\x2C35.68\x2C14.09\x2C14.09\x2C0\x2C0\x2C1\x2C49.49\x2C15.73a14\x2C14\x2C0\x2C0\x2C1-5.66-8.55\x2C44\x2C44\x2C0\x2C0\x2C0-21.09\x2C6.15A44.26\x2C44.26\x2C0\x2C0\x2C0\x2C71.46\x2C87.08\x2C44.24\x2C44.24\x2C0\x2C0\x2C0\x2C89.51\x2C52.86ZM28.28\x2C43.42a2.47\x2C2.47\x2C0\x2C0\x2C1-2.38\x2C1.83h0a2.47\x2C2.47\x2C0\x2C1\x2C1\x2C2.38-1.83Zm3.8\x2C24.9a2.47\x2C2.47\x2C0\x2C1\x2C1\x2C2.47-2.47A2.47\x2C2.47\x2C0\x2C0\x2C1\x2C32.08\x2C68.32ZM44.92\x2C27.13A2.47\x2C2.47\x2C0\x2C1\x2C1\x2C44\x2C23.76\x2C2.47\x2C2.47\x2C0\x2C0\x2C1\x2C44.92\x2C27.13ZM57.28\x2C73.27a2.47\x2C2.47\x2C0\x2C1\x2C1-.9-3.36\x2C2.47\x2C2.47\x2C0\x2C0\x2C1\x2C.9\x2C3.36ZM74.42\x2C55.79a2.47\x2C2.47\x2C0\x2C1\x2C1-.25-1.87A2.45\x2C2.45\x2C0\x2C0\x2C1\x2C74.42\x2C55.79Z\"/><path d\x3D\"M97.93\x2C48.52v-.2A2.35\x2C2.35\x2C0\x2C0\x2C0\x2C95.7\x2C46a9.37\x2C9.37\x2C0\x2C0\x2C1-8-5.45\x2C2.35\x2C2.35\x2C0\x2C0\x2C0-3.49-.93\x2C9.51\x2C9.51\x2C0\x2C0\x2C1-5.44\x2C1.72A9.4\x2C9.4\x2C0\x2C0\x2C1\x2C69.39\x2C31.1a2.35\x2C2.35\x2C0\x2C0\x2C0-2.55-2.55c-.28\x2C0-.57\x2C0-.85\x2C0a9.39\x2C9.39\x2C0\x2C0\x2C1-7.68-14.81\x2C2.35\x2C2.35\x2C0\x2C0\x2C0-.93-3.49\x2C9.37\x2C9.37\x2C0\x2C0\x2C1-5.45-8A2.35\x2C2.35\x2C0\x2C0\x2C0\x2C49.61\x2C0H49a49\x2C49\x2C0\x2C1\x2C0\x2C49\x2C49C97.93\x2C48.82\x2C97.93\x2C48.67\x2C97.93\x2C48.52ZM71.46\x2C87.08A44.26\x2C44.26\x2C0\x2C0\x2C1\x2C22.74\x2C13.33\x2C44\x2C44\x2C0\x2C0\x2C1\x2C47.53\x2C4.72a14\x2C14\x2C0\x2C0\x2C0\x2C5.66\x2C8.55A14.09\x2C14.09\x2C0\x2C0\x2C0\x2C64.71\x2C33.22\x2C14.09\x2C14.09\x2C0\x2C0\x2C0\x2C84.66\x2C44.75a14\x2C14\x2C0\x2C0\x2C0\x2C8.56\x2C5.66A44.3\x2C44.3\x2C0\x2C0\x2C1\x2C71.46\x2C87.08Z\"/></g></g></svg></div>\' : \'\';\n\t\tvar cookiePolicyTarget \x3D settings.cookiePolicyButtonTarget \x3D\x3D\x3D \'_blank\' || settings.cookiePolicyButtonTarget \x3D\x3D\x3D \'_self\' \? settings.cookiePolicyButtonTarget : settings.cookiePolicyButtonTarget;\n\n\t\t\tvar cookieApp \x3D {\n\t\t\t\tinit: function() {\n\t\t\t\t\tcookieApp.body();\n\t\t\t\t\tcookieApp.painter();\n\t\t\t\t\tcookieApp.checkCookie(); \n\t\t\t\t}\x2C\n\t\t\t\tbody: function() {\n                                       var pButton \x3D \"\";\n                                       var iCaller \x3D settings.teccCaller;\n                                       if ( settings.showPolicy \x3D\x3D true) {\n                                           if ( settings.linkHandler \x3D\x3D \"Xojo\") {                           \n        \t\t\t\t\tvar pButton \x3D \"<a  class\x3D\'cookie-policy-btn\' href\x3D\'#\'>\"\n\t\t\t\t\t\t\t\t\t\t+settings.cookiePolicyButtonText+\n\t\t\t\t\t\t\t\t\t\"</a>\";\n\t\t\t\t\t\t} else {\n\t\t\t\t\t\t var pButton \x3D \'<a class\x3D\"cookie-policy-btn\" href\x3D\' + settings.cookiePolicyButtonUrl + \' target\x3D\' + cookiePolicyTarget + \'>\'\n\t\t\t\t\t\t\t\t\t\t\t\t+settings.cookiePolicyButtonText+\n\t\t\t\t\t\t\t\t\t  \'</a>\';\n                                            }\n                                        };\n\t\t\t\t\t$(\"body\").append(\n\t\t\t\t\t\t\'<div class\x3D\"cookie-bubble \'+box_visibility +settings.boxPosition+\'\">\'+\n\t\t\t\t\t\t\t\'<div class\x3D \"cb-wrapper\">\'+\n\t\t\t\t\t\t\t\t\'<div class\x3D\"cb-row\">\'+\n\t\t\t\t\t\t\t\t\tbox_iconVisibility+\n\t\t\t\t\t\t\t\t\t\'<div class\x3D\"cb-row-content\">\'+\n\t\t\t\t\t\t\t\t\t\t\'<span class\x3D\"message\">\'+settings.messageText+\'</span>\'+\n\t\t\t\t\t\t\t\t\t\t\'<div class\x3D\"cb-controls\">\'+\n\t\t\t\t\t\t\t\t\t\t\t\'<button  class\x3D\"agreement-btn\">\' + settings.buttonText + \'</button>\' +\n\t\t\t\t\t\t\t\t\t\t\t\tpButton +\n                                                                \t\t\'</div>\' +\n\t\t\t\t\t\t\t\t\t\'</div>\'+\n\t\t\t\t\t\t\t\'</div >\'+\n\t\t\t\t\t\t\'</div >\'\n\n\t\t\t\t\t); \n\n                                      if (settings.linkHandler \x3D\x3D \"Xojo\") {\n\t\t\t\t\t\tvar button \x3D $(\'.cookie-bubble .cookie-policy-btn\'); \n\t\t\t\t    \t\tbutton.click(function(event) {\n\t\t\t\t\t\t\t\talert(\'jmu2\');\n\t\t\t\t\t        });\n                                       }\n\n\n\n\t\t\t\t}\x2C\n\t\t\t\tpainter:function(){\n\t\t\t\t\tvar cb_message \t\t\t  \x3D $(\'.cookie-bubble .cb-wrapper .cb-row .cb-row-content .message\')\x2C\n\t\t\t\t\t\tcb_button \t\t\t  \x3D $(\'.cookie-bubble .cb-wrapper .cb-row .cb-row-content .agreement-btn\')\x2C\n\t\t\t\t\t\tcb_cookie_policy_btn  \x3D $(\'.cookie-bubble .cb-wrapper .cb-row .cookie-policy-btn\');\n\n\n\t\t\t\t\tvar style_message \x3D {\n\t\t\t\t\t\t\'color\': settings.messageTextColor\x2C\n\t\t\t\t\t\t\'font-size\': settings.messageFontSize\n\t\t\t\t\t}\n\n\t\t\t\t\tvar style_agreement_btn \x3D {\n\t\t\t\t\t\t\'background-color\': settings.buttonColor\x2C\n\t\t\t\t\t\t\'font-size\': settings.buttonFontSize\n\t\t\t\t\t}\n\n\t\t\t\t\tvar style_cookie_policy_btn \x3D {\n\t\t\t\t\t\t\'color\': settings.cookiePolicyButtonTextColor\n\t\t\t\t\t}\n\t\t\t\t\n\t\t\t\t\tcb_message.css(style_message);\n\t\t\t\t\tcb_button.css(style_agreement_btn);\n\t\t\t\t\tcb_cookie_policy_btn.css(style_cookie_policy_btn);\n\t\t\t\t}\x2C\n\t\t\t\tsetCookie:function(cname\x2Ccvalue\x2Cexdays) {\n\t\t\t\t    var d \x3D new Date();\n\t\t\t\t    d.setTime(d.getTime() + (exdays*24*60*60*1000));\n\t\t\t\t    var expires \x3D \"expires\x3D\" + d.toGMTString();\n\t\t\t\t    document.cookie \x3D cname + \"\x3D\" + cvalue + \";\" + expires + \";path\x3D/\";\n\t\t\t\t}\x2C\n\t\t\t\tgetCookie: function(cname) {\n\t\t\t\t    var name \x3D cname + \"\x3D\";\n\t\t\t\t    var decodedCookie \x3D decodeURIComponent(document.cookie);\n\t\t\t\t    var ca \x3D decodedCookie.split(\';\');\n\t\t\t\t    for(var i \x3D 0; i < ca.length; i++) {\n\t\t\t\t        var c \x3D ca[i];\n\t\t\t\t        while (c.charAt(0) \x3D\x3D \' \') {\n\t\t\t\t            c \x3D c.substring(1);\n\t\t\t\t        }\n\t\t\t\t        if (c.indexOf(name) \x3D\x3D 0) {\n\t\t\t\t            return c.substring(name.length\x2C c.length);\n\t\t\t\t        }\n\t\t\t\t    }\n\t\t\t\t    return \"\";\n\t\t\t\t}\x2C\n\t\t\t\tcheckCookie: function() {\n\t\t\t\t\tvar get_cookie \x3D cookieApp.getCookie(private_opt.cookieName);\n\n\t\t\t\t\tif (get_cookie !\x3D \"\" && get_cookie !\x3D null) {\n\t\t\t\t\t\t$(\'.cookie-bubble\').removeClass(\'show\').addClass(\'hide\'); \n\t\t\t\t\t\t\n\t\t\t\t    } else {\n\t\t\t\t\t\t\tsetTimeout(function () {\n\t\t\t\t\t\t\t\t$(\'.cookie-bubble\').removeClass(\'hide\').addClass(\'show\');\n\t\t\t\t\t\t\t}\x2C settings.boxAppearDelay);\n\n\t\t\t\t\t\t\tvar button \x3D $(\'.cookie-bubble .agreement-btn\'); \n\t\t\t\t    \t\tbutton.click(function(event) {\n\t\t\t\t\t\t\t\tcookieApp.setCookie(private_opt.cookieName\x2C private_opt.cookieValue\x2C settings.cookieMaxAge); \n\t\t\t\t\t\t\t\t$(\'.cookie-bubble\').removeClass(\'show\').addClass(\'hide\'); \n\t\t\t\t\t\t});\n\t\t\t\t    }\n\t\t\t\t}\n\n\t\t\t}\n\t\t\tcookieApp.init();\n\t};\n})(jQuery);", Scope = Private
	#tag EndConstant

	#tag Constant, Name = LibraryIcon, Type = String, Dynamic = False, Default = \"", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NavigatorIcon, Type = String, Dynamic = False, Default = \"iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABemlDQ1BJQ0MgUHJvZmlsZQAAKJF9kE0rRFEYx39miLzNgoWFxY1hY4hRYqPMJNQsNCiDzZ1rXtTMuN25QjYWynaKEhtvCz4BGwtlrZQiJTtfgNhI13NmaLyUp57z/M5znvPvnD+4fLpppko7IZ2xrfBQQJuMTGnlj5TRiIda2nQjaw6MjoaQ+Ko/4/WGElWv25XW3/N/o2o2ljWgpEK43zAtW3hYuHnRNhUrvXpLHiW8qjhR4E3F0QIf52fGw0HhM2HNSOqzwvfCPiNppcGl9L3RbzOJb5xOLRif71E/qY5lJsakNkk2kiXMEAE0RhgkSA9d9MnaQzt+OmSHHVuy1eXgvLlszSWStjYgTsS0kYzR4dP8nX6ZUb7+9qvYm9+D3hdw54q96BacrkPDXbHn3QXPGpxcmLql51tuSVc8Dk9HUBOBuiuonM7Gu/2FH1UHoOzBcZ5boHwD3nOO87bvOO8Hclk8Os8UPPrU4vAWxlcgdAnbO9Aq2p6ZDyszZzCPSKziAAAAbGVYSWZNTQAqAAAACAAEARoABQAAAAEAAAA+ARsABQAAAAEAAABGASgAAwAAAAEAAgAAh2kABAAAAAEAAABOAAAAAAAAAGAAAAABAAAAYAAAAAEAAqACAAQAAAABAAAAEKADAAQAAAABAAAAEAAAAADImMOoAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAA3ElEQVQ4Ec2TPQrCQBCFVwUvYWthL2ihpVgL2trZ2nsBGyuxtlBvYGXvBTyB9jYJ/iP4900IYbIoxLVx4YO3O/PeTkJijDFZGIEHz4RIr3jEG4ikRrtPQr662Q7wUgTIofNKOztD47uAG7WjCj4ofUbf1T6Q+rkWnFShCWtoQAuWMIUa9EF7YpsSxb1qqKAnIFMNoANb+BhQpKgDduy7MIQHzEFCowD7HfQo1kHG3kAbVpAHmWAGBYitKI1T0Vc4KX0JtdRkolj/f3wHPmO5Lj+DMwdlx4Sx+H76nV8sE3ug9JK8jwAAAABJRU5ErkJggg\x3D\x3D", Scope = Public
	#tag EndConstant


	#tag Enum, Name = boxPositions, Type = Integer, Flags = &h0
		bottom_left
		  bottom_center
		  bottom_right
		  top_left
		  top_center
		top_right
	#tag EndEnum

	#tag Enum, Name = PolicyButtonTargets, Type = Integer, Flags = &h0
		NewPage
		SamePage
	#tag EndEnum

	#tag Enum, Name = PolicyURLHandlers, Type = Integer, Flags = &h0
		XojoEvent
		BrowserLink
	#tag EndEnum


	#tag ViewBehavior
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
			Name="OwnCookieMaxAgeDays"
			Visible=true
			Group="teccGDPR"
			InitialValue="30"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BoxPosition"
			Visible=true
			Group="teccGDPR"
			InitialValue="2"
			Type="boxPositions"
			EditorType="Enum"
			#tag EnumValues
				"0 - bottom_left"
				"1 - bottom_center"
				"2 - bottom_right"
				"3 - top_left"
				"4 - top_center"
				"5 - top_right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageText"
			Visible=true
			Group="teccGDPR"
			InitialValue="We use cookies to personalize your experience. By continuing to visit this website you agree to our use of cookies."
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageFontSize"
			Visible=true
			Group="teccGDPR"
			InitialValue="18"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageTextColor"
			Visible=true
			Group="teccGDPR"
			InitialValue="&c424242"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonText"
			Visible=true
			Group="teccGDPR"
			InitialValue="Got it!"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonFontSize"
			Visible=true
			Group="teccGDPR"
			InitialValue="14"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ButtonColor"
			Visible=true
			Group="teccGDPR"
			InitialValue="&c0096FF"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IconColor"
			Visible=true
			Group="teccGDPR"
			InitialValue="&c935100"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IconVisibility"
			Visible=true
			Group="teccGDPR"
			InitialValue="true"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PolicyButtonShow"
			Visible=true
			Group="teccGDPR"
			InitialValue="true"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PolicyURLHandler"
			Visible=true
			Group="teccGDPR"
			InitialValue="0"
			Type="PolicyURLHandlers"
			EditorType="Enum"
			#tag EnumValues
				"0 - XojoEvent"
				"1 - BrowserLink"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="PolicyButtonText"
			Visible=true
			Group="teccGDPR"
			InitialValue="Read Our Cookie Policy"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PolicyButtonTextColor"
			Visible=true
			Group="teccGDPR"
			InitialValue="&c797979"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PolicyButtonURL"
			Visible=true
			Group="teccGDPR"
			InitialValue="https://blog.xojodocs.com"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PolicyButtonTarget"
			Visible=true
			Group="teccGDPR"
			InitialValue="0"
			Type="PolicyButtonTargets"
			EditorType="Enum"
			#tag EnumValues
				"0 - NewPage"
				"1 - SamePage"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="BoxAppearDelay"
			Visible=true
			Group="teccGDPR"
			InitialValue="1000"
			Type="Integer"
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
