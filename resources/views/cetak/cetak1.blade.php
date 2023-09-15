<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="{{asset('/public/css/report.css')}}" rel="stylesheet" type="text/css" media="all">
    <link href="{{asset('/public/css/report-screen.css')}}" rel="stylesheet" type="text/css" media="screen">
    <title>SERTIFIKAT</title>
    <style media="all" type="text/css">
        body{
            font-family:Verdana, Geneva, sans-serif;
            font-size:12px;
            padding:0px;
            margin:0px;
        } 
        .TebalBorder{ 
            border-bottom:solid 2px;
        } 
        p{
            text-indent:40px;
        }
    </style>
</head>

<body>
    <table class="screen panjang page-break">
        <tbody>
            <tr>
                <td class="jarak">
                    <table class="lebarKertasTegak" cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                            <tr>
                                <td class="" style="height: 70mm;"></td>
                            </tr>
                            <tr style="margin-bottom:30px;">
                                @php
                                $bulan = ['','I','II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII'];
                                $mytime = Carbon\Carbon::make(date("Y-m-d"));
                                @endphp
                                <td class="headerFont fontCenter paddingfont" style="font-size:13px">{{$acara->nama}}</td>
                            </tr>
                            <tr>
                                <td class="fontCenter paddingfont" style="font-size:13px">NOMOR : {{$acara->nomor}}</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            
                            <tr>
                                <td>
                                    <table class="table-padding" width="100%" cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="width:5%;"></td>
                                                <td class="paddingfont" style="font-size:13px">Berdasarkan :</td>
                                            </tr>
                                            <tr>
                                                <td class="paddingfont" style="font-size:13px">a</td>
                                                <td class="paddingfont" style="font-size:13px" colspan="2">Peraturan Menteri Kesehatan Republik Indonesia Nomor 14 Tahun 2021 tentang Standar Kegiatan Usaha dan Produk Pada Penyelenggaraan Perizinan Berusaha Berbasis Risiko Sektor Kesehatan</td>
                                            </tr>
                                            <tr>
                                                <td class="paddingfont" style="font-size:13px">b</td>
                                                <td class="paddingfont" style="font-size:13px" colspan="2">Peraturan Menteri Kesehatan Republik Indonesia Nomor 14 Tahun 2021 tentang Standar Kegiatan Usaha dan Produk Pada Penyelenggaraan Perizinan Berusaha Berbasis Risiko Sektor Kesehatan</td>
                                            </tr>
                                            <tr>
                                                <td class="paddingfont" style="font-size:13px">c</td>
                                                <td class="paddingfont" style="font-size:13px" colspan="2">Peraturan Menteri Kesehatan Republik Indonesia Nomor 14 Tahun 2021 tentang Standar Kegiatan Usaha dan Produk Pada Penyelenggaraan Perizinan Berusaha Berbasis Risiko Sektor Kesehatan</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="2"></td>
                                            </tr>
                                            
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:13px" colspan="2">Telah dilaksanakan {{$acara->nama}} bagi {{$peserta->jabatan}} yang diselenggarakan oleh Dinas Kesehatan Kota Surabaya pada tanggal {{\Carbon\Carbon::make($acara->tanggal)->translatedFormat('d-m-Y')}} dengan ini memberikan sertifikat kepada :</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="width:35%;font-size: 13px;">Nama</td>
                                                <td class="paddingfont" style="font-size:13px">: {{$peserta->nama}}</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:13px">Tempat, Tanggal Lahir</td>
                                                <td class="paddingfont" style="font-size:13px">: {{$peserta->tempatlahir}}</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:13px">Alamat</td>
                                                <td class="paddingfont" style="font-size:13px">: {{$peserta->alamat}}</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:13px">Pekerjaan / Jabatan</td>
                                                <td class="paddingfont" style="font-size:13px">: {{$peserta->jabatan}}</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:13px">Perusahaan / Unit Kerja</td>
                                                <td class="paddingfont" style="font-size:13px">: {{$peserta->unitkerja}}</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="2"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="paddingfont" style="font-size:13px" colspan="2">Pemegang Sertifikat ini telah memnuhi syarat dan dipandang cakap untuk mengelola</td>
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
                                    <table width="100%" cellspacing="0" cellpadding="0" >
                                        <tbody>
                                            <tr>
                                                <td width="70%" class="keterangan">
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    ASLI disampaikan dengan hormat kepada :<br>
                                                    Kepala Kantor Regional II BKN di Sidoarjo ;<br>
                                                    <br>
                                                    TEMBUSAN disampaikan kepada :<br>
                                                    1. Pegawai yang bersangkutan<br>
                                                    2. Kepala $data->unitKerja->nama<br>
                                                    3. Kepala Badan Kepegawaian dan Diklat Pemerintah Kota Surabaya<br>

                                                </td>
                                                <td class="fontBold">
                                                    DITETAPKAN DI : SURABAYA<br>
                                                    PADA TANGGAL : <br><br>
                                                    <div class="fontCenter">KEPALA DINAS KESEHATAN</div>
                                                    <div class="fontCenter">KOTA SURABAYA</div>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <div class="fontCenter" style="text-decoration: underline;">Nanik Sukristina, S.KM, M.Kes</div>
                                                    <div class="fontCenter">Pembina Tk. I</div>
                                                    <div class="fontCenter">NIP 197001171994032008</div>
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
        </tbody>
    </table>
    <script>
        // window.print();
    </script>
</body>

</html>