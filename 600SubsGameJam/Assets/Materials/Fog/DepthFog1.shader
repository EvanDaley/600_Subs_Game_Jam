// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "EvanDaley/DepthFog1"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_FogIntensity("FogIntensity", Float) = 0
		_FogColor("FogColor", Color) = (0.2941176,0.2724913,0.2724913,0)
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" }
		Cull Back
		CGPROGRAM
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf Standard alpha:fade keepalpha  noshadow 
		struct Input
		{
			float4 screenPos;
		};

		uniform float4 _FogColor;
		uniform sampler2D _CameraDepthTexture;
		uniform float _FogIntensity;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Albedo = _FogColor.rgb;
			float eyeDepth2 = LinearEyeDepth(UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture,UNITY_PROJ_COORD(i.screenPos))));
			o.Alpha = ( abs( ( eyeDepth2 - i.screenPos.w ) ) * _FogIntensity );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=7003
2115;155;1257;804;1416.501;454.2992;1.3;True;False
Node;AmplifyShaderEditor.ScreenPosInputsNode;1;-1017.699,69.19997;Float;False;1;False;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.ScreenDepthNode;2;-881.7994,-43.7;Float;False;0;0;FLOAT4;0,0,0,0;False;FLOAT
Node;AmplifyShaderEditor.SimpleSubtractOpNode;3;-684.3992,97.09995;Float;False;0;FLOAT;0.0;False;1;FLOAT;0.0;False;FLOAT
Node;AmplifyShaderEditor.AbsOpNode;5;-481.7999,163.2003;Float;False;0;FLOAT;0.0;False;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;6;-626.1013,281.5002;Float;False;Property;_FogIntensity;FogIntensity;0;0;0;0;0;FLOAT
Node;AmplifyShaderEditor.ColorNode;7;-458.4022,-165.6998;Float;False;Property;_FogColor;FogColor;1;0;0.2941176,0.2724913,0.2724913,0;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;-325.2001,174.4;Float;False;0;FLOAT;0.0;False;1;FLOAT;0.1;False;FLOAT
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-71,0;Float;False;True;2;Float;ASEMaterialInspector;0;Standard;EvanDaley/DepthFog1;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Transparent;0.5;True;False;0;False;Transparent;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;False;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;Relative;0;;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;13;OBJECT;0.0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False
WireConnection;2;0;1;0
WireConnection;3;0;2;0
WireConnection;3;1;1;4
WireConnection;5;0;3;0
WireConnection;4;0;5;0
WireConnection;4;1;6;0
WireConnection;0;0;7;0
WireConnection;0;9;4;0
ASEEND*/
//CHKSM=4A7BE5E990494EC6BCFDCF82293C501496C95867