<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="{{asset('/public/css/report.css')}}" rel="stylesheet" type="text/css" media="all">
    <link href="{{asset('/public/css/report-screen.css')}}" rel="stylesheet" type="text/css" media="screen">
    <title>PIAGAM PENGHARGAAN</title>
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

        .background {
            background-image: url('{{asset($acara->background)}}');
            background-position: center;
            /* Center the image */
            background-repeat: no-repeat;
            /* Do not repeat the image */
            background-size: cover;
            /* Resize the background image to cover the entire container */
        }

        .background2 {
            background-image: url('{{asset($acara->background2)}}');
            background-repeat: no-repeat;
            /* Do not repeat the image */
            background-size: 100%;
            /* Resize the background image to cover the entire container */
            background-position: center;
            background-size: cover;
            margin-top: 50px;
        }

        .pasfoto {
            width: 3.6cm;
            height: 5.5cm;
            margin-left: 1.2cm;
            border: 2px solid #7d7d7d;
            padding: 2px;
        }
    </style>
</head>

<body class="">
    <div style="margin-top: 10mm;"></div>
    <table class="screen lebar lebarKertasTidur page-break background">
        <tbody>
            <tr>
                <td style="color: #fff;height: 31mm;">.</td>
            </tr>
            <tr>
                <td class="jarak">
                    <table class="lebarTabelTidur" cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="jarak">
                                    <table class="lebarTabelTidur" cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr><br></tr>
                                            <tr style="margin-bottom:20px;">
                                                <td class="fontCenter paddingfont" style="font-size:17px">NOMOR :
                                                    {{$acara->no_surat}}</td>
                                            </tr>
                                            <tr>
                                                <td><br><br></td>
                                            </tr>
                                            <tr>
                                                <td class="fontCenter paddingfont"><br></td>
                                            </tr>
                                            <tr>
                                                <td class="fontCenter paddingfont" style="font-size:22px">
                                                    <b>{{$peserta->nama}}</b></td>
                                            </tr>
                                            <tr>
                                                <td class="fontCenter paddingfont" style="font-size:14px">
                                                    {{$peserta->unitkerja}}</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="fontCenter" style="font-size:17px">Atas prestasinya sebagai :</td>
                                            </tr>
                                            <tr>
                                                <td class="fontCenter paddingfont" style="font-size:22px;font-weight:bold;">
                                                    {{$peserta->jabatan}}</td>
                                            </tr>
                                            <tr>
                                                <td><br><br><br></td>
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
                                                                <td width="65%" class="keterangan">
                                                                </td>
                                                                <td class="" width="35%">
                                                                    <div style="font-size: 15px;margin-bottom: 10px;">
                                                                        Surabaya, {{\Carbon\Carbon::make($acara->tgl_surat)->translatedFormat('d
                                                                        F Y')}}
                                                                        </div>
                                                                    <div style="border: solid black 1px; width: 300px;">
                                                                        <div style="display: flex;">
                                                                            <div style="flex: 32%;" id="formQr">

                                                                            </div>
                                                                            <div style="flex: 68%;">
                                                                                <div
                                                                                    style="font-size: 9px;font-weight: lighter;margin-top: 5px;">
                                                                                    Piagam Penghargaan Ini Ditandatangani Secara
                                                                                    Elektronik Oleh: </div>
                                                                                <div
                                                                                    style="font-size: 11px;font-weight: lighter;">
                                                                                    KEPALA DINAS</div>

                                                                                <div
                                                                                    style="font-size: 10px;font-weight: bold; margin-top:10px;text-decoration: underline;">
                                                                                    NANIK SUKRISTINA, S.KM., M.Kes</div>
                                                                                <div
                                                                                    style="font-size: 9px;font-weight: lighter;">
                                                                                    Pembina Utama Muda</div>
                                                                                <div
                                                                                    style="font-size: 9px;font-weight: lighter;">
                                                                                    NIP 197001171994032008</div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr><td><br></td></tr>
                                            <tr><td><br></td></tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
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
                    contents="`+ window.location.href + `"
                        style="
                        width: 90px;
                        height: 90px;
                        background-color: #fff;
                        ">
                    <img src="{{asset('/public/dist/img/logoSby_32.png')}}"
                        slot="icon" style="width:18px;" />
                </qr-code>`;
        $('#formQr').append(qr);
    </script>
    
</body>

</html>