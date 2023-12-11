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
            width:3.6cm; 
            height:5.5cm; 
            margin-left:1.2cm;
            border: 2px solid #7d7d7d;
            padding: 2px;
        }
    </style>
</head>

<body class="">
    <div style="margin-top: 10mm;"></div>
    <table class="screen panjang lebarKertasTegak page-break background">
        <tbody>
            <tr><td style="color: #fff;height: 80mm;">.</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td class="jarak">
                    <table class="lebarTabelTegak" cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                            <tr>
                                <td class=""></td>
                            </tr>
                            <tr style="margin-bottom:30px;">
                                @php
                                $bulan = ['','I','II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII'];
                                $mytime = Carbon\Carbon::make(date("Y-m-d"));
                                @endphp
                                <td class="headerFont fontCenter paddingfont" style="font-size:16px">{{$acara->acara->nama}}
                                </td>
                            </tr>
                            <tr>
                                <td class="fontCenter paddingfont" style="font-size:15px">Nomor : {{$acara->no_surat}}</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>
                                    <table class="table-padding" width="100%" cellspacing="0" cellpadding="0"
                                        border="0">
                                        <tbody>
                                            <tr><td></td></tr>
                                            <tr>
                                                <td style="width:5%;"></td>
                                                <td class="paddingfont" style="font-size:15px;text-align: justify;">Berdasarkan :</td>
                                            </tr>
                                            <tr>
                                                <td class="paddingfont" style="font-size:15px;text-align: end;">a.</td>
                                                <td class="paddingfont" style="font-size:15px;text-align: justify;line-height:1.3" colspan="3">Peraturan
                                                    Menteri Kesehatan Republik Indonesia Nomor 14 Tahun 2021 tentang
                                                    Standar Kegiatan Usaha dan Produk Pada Penyelenggaraan Perizinan
                                                    Berusaha Berbasis Risiko Sektor Kesehatan.</td>
                                            </tr>
                                            <tr>
                                                <td class="paddingfont" style="font-size:15px;text-align: end;">b.</td>
                                                <td class="paddingfont" style="font-size:15px;text-align: justify;line-height:1.3" colspan="3">Peraturan
                                                    Menteri Kesehatan Republik Indonesia Nomor 1096/Menkes/Per/VI/2011 tentang
                                                    Higiene Sanitasi Jasa Boga.</td>
                                            </tr>
                                            <tr>
                                                <td class="paddingfont" style="font-size:15px;text-align: end;">c.</td>
                                                <td class="paddingfont" style="font-size:15px;text-align: justify;line-height:1.3" colspan="3">Keputusan
                                                    Menteri Kesehatan Nomor 1098/Menkes/SK/VII/2003 tentang
                                                    Persyaratan Hygiene Sanitasi Rumah Makan dan Restoran.</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="3"></td>
                                            </tr>

                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:15px;text-align: justify;line-height:1.3" colspan="3">Telah
                                                    dilaksanakan Evaluasi/Pelatihan Higiene Sanitasi bagi {{$peserta->jabatan}} yang
                                                    diselenggarakan oleh Dinas Kesehatan Kota Surabaya pada tanggal
                                                    {{\Carbon\Carbon::make($acara->acara->tgl_mulai)->translatedFormat('d F Y')}} - {{\Carbon\Carbon::make($acara->acara->tgl_selesai)->translatedFormat('d F Y')}}
                                                    dengan ini memberikan sertifikat kepada :</td>
                                                
                                            </tr>
                                            <tr><td></td></tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="width:35%;font-size: 15px;">Nama</td>
                                                <td class="paddingfont" style="font-size:15px;">:</td>
                                                <td class="paddingfont" style="font-size:15px;font-weight: bold;">{{$peserta->nama}}</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:15px">Tempat, Tanggal Lahir
                                                </td>
                                                <td class="paddingfont" style="font-size:15px;">:</td>
                                                <td class="paddingfont" style="font-size:15px">
                                                    {{$peserta->tempatlahir}}, {{\Carbon\Carbon::make($peserta->tanggallahir)->translatedFormat('d F Y')}}</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:15px">Alamat</td>
                                                <td class="paddingfont" style="font-size:15px;">:</td>
                                                <td class="paddingfont" style="font-size:15px">{{$peserta->alamat}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:15px">Pekerjaan / Jabatan</td>
                                                <td class="paddingfont" style="font-size:15px;">:</td>
                                                <td class="paddingfont" style="font-size:15px">{{$peserta->jabatan}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:15px">Perusahaan / Unit Kerja
                                                </td>
                                                <td class="paddingfont" style="font-size:15px;">:</td>
                                                <td class="paddingfont" style="font-size:15px">{{$peserta->unitkerja}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
												@if($peserta->jabatan == 'Penjamah Makanan')
                                                <td class="paddingfont" style="font-size:15px;line-height:1.3;text-align:justify;" colspan="3">Pemegang
                                                    Sertifikat ini telah memenuhi syarat dan dinilai cakap sebagai Penjamah Makanan <i>(Food Handler)</i>.</td>
												@elseif($peserta->jabatan == 'Pengelola Makanan')
												<td class="paddingfont" style="font-size:15px;line-height:1.3;text-align:justify;" colspan="3">Pemegang
                                                    Sertifikat ini telah memenuhi syarat dan dinilai cakap untuk mengelola higiene sanitasi makanan.</td>
												@endif
                                            </tr>

                                        </tbody>

                                    </table>
                                </td>
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
            <tr><td style="color: #fff;height: 100mm;">.</td></tr>
            <tr><td>&nbsp;</td></tr>
            <tr>
                <td class="jarak">
                    <table class="lebarTabelTegak" cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                            <tr>
                                <td class=""></td>
                            </tr>
                            <tr style="margin-bottom:30px;">
                                <td class="headerFont fontCenter paddingfont" style="font-size:16px">
                                </td>
                            </tr>
                            <tr>
                                <td class="fontCenter paddingfont" style="font-size:16px"></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>

                            <tr>
                                <td>
                                    <table class="table-padding" width="100%" cellspacing="0" cellpadding="0"
                                        border="0">
                                        <tbody>
                                            <tr>
                                                <td style="width:5%;"></td>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                            </tr>
                                            <tr>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                                <td class="paddingfont" style="font-size:15px" colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                                <td class="paddingfont" style="font-size:15px" colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                                <td class="paddingfont" style="font-size:15px" colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="2"></td>
                                            </tr>

                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:15px" colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="width:35%;font-size: 15px;"></td>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                                <td class="paddingfont" style="font-size:15px"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:15px" colspan="2"></td>
                                            </tr>

                                        </tbody>

                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td><br><br></td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td width="35%" class="keterangan">
                                                    @if(isset($peserta->pasfoto))
                                                    <img src="{{$peserta->pasfoto}}" class="pasfoto" alt="Pasfoto">
                                                    @else
                                                    <svg width="3.6cm" height="5.5cm" class="pasfoto">
                                                        <rect width="3.6cm" height="5.5cm" style="fill:#DDDDDD;" />
                                                        <text x="23%" y="55%" fill="grey" style="font-size:25px;">Pasfoto</text>
                                                        Sorry, your browser does not support inline SVG.  
                                                    </svg>
                                                    @endif
                                                </td>
                                                <td class="">
                                                    
                                                    <div style="border: solid black 1px; width: 90px; margin-top: 130px;">
                                                        <div style="display: flex;">
                                                            <div id="formQr2"></div>
                                                            
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
                        width: 90px;
                        height: 90px;
                        background-color: #fff;
                        ">
                    <img src="{{asset('/public/dist/img/logoSby_32.png')}}"
                        slot="icon" style="width:18px;" />
                </qr-code>`;
        $('#formQr').append(qr);
    </script>
    <script>
        var qr2 = `<qr-code id="qr2"
                    contents="`+window.location.href+`"
                        style="
                        width: 90px;
                        height: 90px;
                        background-color: #fff;
                        ">
                    <img src="{{asset('/public/dist/img/logoSby_32.png')}}"
                        slot="icon" style="width:18px;" />
                </qr-code>`;
        $('#formQr2').append(qr);
    </script>
</body>

</html>