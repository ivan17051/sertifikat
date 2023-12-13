<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="{{asset('/public/css/report.css')}}" rel="stylesheet" type="text/css" media="all">
    <link href="{{asset('/public/css/report-screen.css')}}" rel="stylesheet" type="text/css" media="screen">
    <title>SERTIFIKAT</title>
    <style media="all" type="text/css">
        body {
            font-family: Verdana, Geneva, sans-serif;
            font-size: 12px;
            padding: 0px;
            margin: 0px;
        }

        .TebalBorder {
            border-bottom: solid 2px;
        }

        p {
            text-indent: 40px;
        }

        .background{
            background-image: url('{{asset($acara->background)}}');
            background-position: center; /* Center the image */
            background-repeat: no-repeat; /* Do not repeat the image */
            background-size: cover; /* Resize the background image to cover the entire container */
        }

        .background2 {
            background-image: url('{{asset($acara->background2)}}');
            background-repeat: no-repeat;
            /* Do not repeat the image */
            background-size: 100%;
            /* Resize the background image to cover the entire container */
            background-position: center;
            background-size: cover;
        }

        .pasfoto {
            width:4cm; 
            height:6cm; 
            margin-left:1.2cm;
            border: 2px solid #7d7d7d;
            padding: 2px;
        }
    </style>
</head>

<body class="">
    <div style="margin-top: 20mm;"></div>
    <table class="screen panjang lebarKertasTegak page-break background">
        <tbody>
            <tr><td>.</td></tr>
            <tr><td style="color: #fff;height: 70mm;">.</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td class="jarak">
                    <table class="lebarTabelTegak" cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                            <tr>
                                <td class=""></td>
                            </tr>
                            
                            <tr style="margin-bottom:40px;">
                                <td class="fontCenter paddingfont" style="font-size:17px">NOMOR : {{$acara->no_surat}}</td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td class="fontCenter paddingfont" style="font-size:17px">Diberikan Kepada :</td>
                            </tr>
                            <tr>
                                <td class="fontCenter paddingfont" style="font-size:22px"><b>{{$peserta->nama}}</b></td>
                            </tr>
                            <tr>
                                <td class="fontCenter paddingfont" style="font-size:17px">{{$peserta->unitkerja}}</td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>

                            <tr>
                                <td class="fontCenter paddingfont" style="font-size: 17px;">Atas ikut sertanya dalam Pelatihan :</td>
                            </tr>
                            <tr>
                                <td class="headerFont fontCenter paddingfont" style="font-size:22px">{{$acara->acara->nama}}</td>
                            </tr>
                            <tr>
                                <td class="fontCenter paddingfont" style="font-size: 17px;">Pada tanggal {{\Carbon\Carbon::make($acara->acara->tgl_mulai)->translatedFormat('d M Y')}} - {{\Carbon\Carbon::make($acara->acara->tgl_selesai)->translatedFormat('d M Y')}}</td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td width="45%" class="keterangan">
                                                </td>
                                                <td class="" width="45%">
                                                    <div style="font-size: 15px;margin-bottom: 10px;">Surabaya, {{\Carbon\Carbon::make($acara->tgl_surat)->translatedFormat('d F Y')}}</div> 
                                                    <div style="border: solid black 1px; width: 300px;">
                                                        <div style="display: flex;">
                                                            <div style="flex: 32%;" id="formQr">
                                                                
                                                            </div>
                                                            <div style="flex: 68%;">
                                                                <div style="font-size: 9px;font-weight: lighter;margin-top: 5px;">Sertifikat Ini Ditandatangani Secara Elektronik Oleh: </div>
                                                                <div style="font-size: 11px;font-weight: lighter;">KEPALA DINAS</div>
                                                                
                                                                <div style="font-size: 10px;font-weight: bold; margin-top:10px;text-decoration: underline;">NANIK SUKRISTINA, S.KM., M.Kes</div>
                                                                <div style="font-size: 9px;font-weight: lighter;">Pembina Utama Muda</div>
                                                                <div style="font-size: 9px;font-weight: lighter;">NIP 197001171994032008</div>
                                                            </div>
                                                        </div>
                                                            
                                                        </div>


                                                    </div>

                                                
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td style="color: #fff;">.</td>
            </tr>
        </tbody>
    </table>
    <table class="screen panjang lebarKertasTegak page-break background2">
        <tbody>
            <tr><td>.</td></tr>
            <tr><td style="color: #fff;height: 70mm;">.</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td class="jarak">
                    <table class="lebarTabelTegak" cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                            <tr>
                                <td class=""></td>
                            </tr>
                            
                            <tr style="margin-bottom:40px;">
                                <td class="fontCenter paddingfont" style="font-size:17px"></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td width="45%" class="">
                                                    @if(isset($peserta->pasfoto))
                                                    <img src="{{$peserta->pasfoto}}" class="pasfoto" alt="Pasfoto">
                                                    @else
                                                    <svg width="4cm" height="6cm" class="pasfoto">
                                                        <rect width="4cm" height="6cm" style="fill:#DDDDDD;" />
                                                        <text x="23%" y="55%" fill="grey" style="font-size:25px;">Pasfoto</text>
                                                        Sorry, your browser does not support inline SVG.  
                                                    </svg>
                                                    @endif
                                                </td>
                                                <td class="fontBold">
                                                    
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr>
                <td style="color: #fff;">.</td>
            </tr>
        </tbody>
    </table>
    <script>
        // window.print();
    </script>
    <!-- jQuery -->
    <script src="{{asset('public/plugins/jquery/jquery.min.js')}}"></script>
    <script src="https://unpkg.com/@bitjson/qr-code@1.0.2/dist/qr-code.js"></script>
    <script>
        var qr = `<qr-code id="qr1"
                    contents="`+window.location.href+`"
                        style="
                        width: 110px;
                        height: 110px;
                        background-color: #fff;
                        ">
                    <img src="{{asset('/public/dist/img/logoSby_32.png')}}"
                        slot="icon" style="width:22px;" />
                </qr-code>`;
        $('#formQr').append(qr);
    </script>
</body>

</html>