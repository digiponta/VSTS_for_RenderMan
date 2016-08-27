# VSTS_for_RenderMan
[Master]
    Very Simple Toon Shader (REYES) for Pixar RenderMan 3.1 or the later: toon06 (for a face) and toon05 (for others),
    made by Hirofumi Inomata, (C) 1998-1999, 
    MIT License ( https://opensource.org/licenses/mit-license.php )
    
    I will port them to RIS.

[PARAMETERS] 

( IN JAPANESE LANGUAGE ) 注）下記のパラメータは相対的な値です。

- "iv_border": 縁線の色 (縁線は、Maya TOON機能を使ってください)
- "iv_shadow": 影の色
- "iv_bright": スペキュラの色
- "iv_range_shadow": 影の幅
- "iv_range_bright": スペキュラの幅
- "iv_range_border": 縁線の幅（Maya Toon機能のアウトライン生成を使う場合は、使わないようにする）
- "iv_transparency": 透明度（機能しない）
- "iv_bump_scale": バンプマップ（実際には、ディスプレースメントマップ）の振幅調整
- "iv_eye_ds": 目のテキスチャの位置オフセット縦
- "iv_eye_dt": 目のテキスチャの位置オフセット横
- "texture_face": 顔のテキスチャ
- "texture_eye": 目のテキスチャ
- "bump_name": 目のへこみのディスプレースメントマップ 

( IN ENGLISH LANGUAGE )

- "iv_border": border color (You should use the feature of Maya TOON for generating outline curves.)
- "iv_shadow": shadow color
- "iv_bright": specular color
- "iv_range_shadow": width for shadow
- "iv_range_bright": width for specular
- "iv_range_border": width for border (You should not use it with Maya Toon outline.）
- "iv_transparency": transparency (not implemented）
- "iv_bump_scale": scale for bump map
- "iv_eye_ds": vertical offet for the texure for eyes
- "iv_eye_dt": Horizontal offset for the texure for eyes
- "texture_face": Texure file for the face
- "texture_eye": Texure file for the eyes
- "bump_name": Displacement map file for eyes 

[REFERENCES]
- SIGGRAP99 Course Notes 17, "Non-Photorealistic Rendering" 
- Steve Upstill, "The RenderMan Companion A programmer's Guide to Prealistics Computer Graphics" 

[]
- I had lost the SL source code for the keke01.
