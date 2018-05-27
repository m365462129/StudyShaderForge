// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33659,y:32720,varname:node_9361,prsc:2|custl-2754-OUT;n:type:ShaderForge.SFN_NormalVector,id:5070,x:32153,y:32609,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:7149,x:32153,y:32805,varname:node_7149,prsc:2;n:type:ShaderForge.SFN_Dot,id:2804,x:32384,y:32700,varname:node_2804,prsc:2,dt:1|A-5070-OUT,B-7149-OUT;n:type:ShaderForge.SFN_Tex2d,id:4937,x:32384,y:32902,ptovrint:False,ptlb:node_4937,ptin:_node_4937,varname:node_4937,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3097,x:32624,y:32811,varname:node_3097,prsc:2|A-2804-OUT,B-4937-RGB;n:type:ShaderForge.SFN_Dot,id:5786,x:32422,y:32379,varname:node_5786,prsc:2,dt:1|A-1077-OUT,B-5070-OUT;n:type:ShaderForge.SFN_HalfVector,id:1077,x:32153,y:32429,varname:node_1077,prsc:2;n:type:ShaderForge.SFN_Power,id:5281,x:32857,y:32364,varname:node_5281,prsc:2|VAL-5786-OUT,EXP-6175-OUT;n:type:ShaderForge.SFN_Exp,id:6175,x:32775,y:32590,varname:node_6175,prsc:2,et:1|IN-5520-OUT;n:type:ShaderForge.SFN_Slider,id:5520,x:32446,y:32590,ptovrint:False,ptlb:node_5520,ptin:_node_5520,varname:node_5520,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Multiply,id:1866,x:33169,y:32342,varname:node_1866,prsc:2|A-5281-OUT,B-3546-OUT;n:type:ShaderForge.SFN_Slider,id:3546,x:32939,y:32546,ptovrint:False,ptlb:node_3546,ptin:_node_3546,varname:node_3546,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:10;n:type:ShaderForge.SFN_Add,id:2754,x:33271,y:32869,varname:node_2754,prsc:2|A-1866-OUT,B-3097-OUT;proporder:4937-5520-3546;pass:END;sub:END;*/

Shader "Shader Forge/NewShader" {
    Properties {
        _node_4937 ("node_4937", 2D) = "white" {}
        _node_5520 ("node_5520", Range(0, 10)) = 0
        _node_3546 ("node_3546", Range(0, 10)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_4937; uniform float4 _node_4937_ST;
            uniform float _node_5520;
            uniform float _node_3546;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float4 _node_4937_var = tex2D(_node_4937,TRANSFORM_TEX(i.uv0, _node_4937));
                float3 finalColor = ((pow(max(0,dot(halfDirection,i.normalDir)),exp2(_node_5520))*_node_3546)+(max(0,dot(i.normalDir,lightDirection))*_node_4937_var.rgb));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_4937; uniform float4 _node_4937_ST;
            uniform float _node_5520;
            uniform float _node_3546;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float4 _node_4937_var = tex2D(_node_4937,TRANSFORM_TEX(i.uv0, _node_4937));
                float3 finalColor = ((pow(max(0,dot(halfDirection,i.normalDir)),exp2(_node_5520))*_node_3546)+(max(0,dot(i.normalDir,lightDirection))*_node_4937_var.rgb));
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
