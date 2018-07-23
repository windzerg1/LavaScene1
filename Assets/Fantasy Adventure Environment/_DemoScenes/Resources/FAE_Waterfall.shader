// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FAE/Waterfall"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_Shadermap("Shadermap", 2D) = "white" {}
		_Speed("Speed", Float) = 1
		_Float1("Float 1", Range( 0 , 1)) = 0
		_Diffuse("Diffuse", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			float2 uv_texcoord;
			float2 texcoord_0;
		};

		uniform sampler2D _Diffuse;
		uniform float4 _Diffuse_ST;
		uniform sampler2D _Shadermap;
		uniform float _Speed;
		uniform float _Float1;
		uniform float4 _Shadermap_ST;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 appendResult15 = float2( 1 , _Float1 );
			o.texcoord_0.xy = v.texcoord.xy * appendResult15 + float2( 0,0 );
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Diffuse = i.uv_texcoord * _Diffuse_ST.xy + _Diffuse_ST.zw;
			float4 temp_cast_0 = (1.0).xxxx;
			float2 uv_Shadermap = i.uv_texcoord * _Shadermap_ST.xy + _Shadermap_ST.zw;
			float4 temp_cast_1 = (tex2D( _Shadermap, uv_Shadermap ).g).xxxx;
			o.Albedo = clamp( ( lerp( tex2D( _Diffuse, uv_Diffuse ) , temp_cast_0 , tex2D( _Shadermap, (abs( i.texcoord_0+( _Time.y * _Speed ) * float2(0,1 ))) ).r ) + temp_cast_1 ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) ).rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=10001
-1913;29;1906;1004;1025.301;744.6999;1.3;True;True
Node;AmplifyShaderEditor.RangedFloatNode;16;-2644.901,-24.20001;Float;False;Property;_Float1;Float 1;3;0;0;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.AppendNode;15;-2445,-46.99994;Float;False;FLOAT2;1;0;0;0;4;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;0.0;False;3;FLOAT;0.0;False;1;FLOAT2
Node;AmplifyShaderEditor.RangedFloatNode;6;-2482.399,398.4;Float;False;Property;_Speed;Speed;2;0;1;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.TimeNode;4;-2508.399,129.4;Float;False;0;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-2202.399,291.4;Float;False;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.TextureCoordinatesNode;12;-2243.399,-39.6;Float;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.TexturePropertyNode;2;-1669.2,-236.4;Float;True;Property;_Shadermap;Shadermap;1;0;None;False;white;Auto;0;1;SAMPLER2D
Node;AmplifyShaderEditor.PannerNode;7;-1912.4,184.4;Float;False;0;1;2;0;FLOAT2;0,0;False;1;FLOAT;0.0;False;1;FLOAT2
Node;AmplifyShaderEditor.SamplerNode;25;-1074.2,-454.6992;Float;True;Property;_Diffuse;Diffuse;5;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;10;-426,-253;Float;False;Constant;_Float0;Float 0;3;0;1;0;0;0;1;FLOAT
Node;AmplifyShaderEditor.SamplerNode;3;-1106.6,-44.4;Float;True;Property;_TextureSample0;Texture Sample 0;2;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SamplerNode;23;-1057.3,214.1003;Float;True;Property;_TextureSample1;Texture Sample 1;2;0;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;1.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.LerpOp;9;-250,-81;Float;False;3;0;COLOR;0.0;False;1;FLOAT;0.0,0,0,0;False;2;FLOAT;0.0;False;1;COLOR
Node;AmplifyShaderEditor.SimpleAddOpNode;22;88.50073,-56.99976;Float;False;2;0;COLOR;0.0;False;1;FLOAT;0,0,0,0;False;1;COLOR
Node;AmplifyShaderEditor.ClampOpNode;24;384.001,-14.89969;Float;False;3;0;COLOR;0.0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR
Node;AmplifyShaderEditor.RangedFloatNode;17;-225.4993,433.0002;Float;False;Property;_Opacity;Opacity;4;0;1;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.ColorNode;1;-759,-216;Float;False;Property;_Color;Color;0;0;0.02205884,0.5548683,1,0;0;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;624,-24;Float;False;True;2;Float;ASEMaterialInspector;0;Standard;FAE/Waterfall;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Opaque;0.5;True;True;0;False;Opaque;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;Relative;0;;-1;-1;-1;-1;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;13;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;15;1;16;0
WireConnection;5;0;4;2
WireConnection;5;1;6;0
WireConnection;12;0;15;0
WireConnection;7;0;12;0
WireConnection;7;1;5;0
WireConnection;3;0;2;0
WireConnection;3;1;7;0
WireConnection;23;0;2;0
WireConnection;9;0;25;0
WireConnection;9;1;10;0
WireConnection;9;2;3;1
WireConnection;22;0;9;0
WireConnection;22;1;23;2
WireConnection;24;0;22;0
WireConnection;0;0;24;0
ASEEND*/
//CHKSM=90F3747CF9416DAE97F07D53F43C451227FB28A9