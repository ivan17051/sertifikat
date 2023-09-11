<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="{{asset('/public/css/report.css')}}" rel="stylesheet" type="text/css" media="all">
    <link href="{{asset('/public/css/report-screen.css')}}" rel="stylesheet" type="text/css" media="screen">
    <title>SURAT PERMINTAAN PEMBAYARAN (SPP)</title>
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
    <table class="screen panjang">
        <tbody>
            <tr>
                <td class="jarak">
                    <table class="lebarKertasTegak" cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                            <tr>
                                <td class="headerFont fontCenter paddingfont" style="font-size:16px;text-decoration: underline;">PENETEPAN ANGKA KREDIT</td>
                            </tr>
                            <tr style="margin-bottom:30px;">
                                @php
                                $bulan = ['','I','II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII'];
                                $mytime = Carbon\Carbon::make(date("Y-m-d"));
                                @endphp
                                <td class="headerFont fontCenter paddingfont" style="font-size:12px">Nomor: @php echo $nomor @endphp</td>
                            </tr>
                            <tr>
                                <td class="fontCenter paddingfont" style="font-size:12px">Masa Penilaian : @if(isset($data->sejak)) {{Carbon\Carbon::make($data->sejak)->translatedFormat('F Y')}} @endif s/d @if(isset($data->sejak)) {{Carbon\Carbon::make($data->hingga)->translatedFormat('F Y')}} @endif</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="paddingfont" style="font-size:12px">INSTANSI : DINAS KESEHATAN KOTA SURABAYA</td>
                            </tr>
                            <tr>
                                <td>
                                    <table class="table-padding" width="100%" cellspacing="0" cellpadding="0" border="1">
                                        <tbody>
                                            <tr class="fontBold">
                                                <td>I</td>
                                                <td></td>
                                                <td class="fontCenter" colspan="5">KETERANGAN PERORANGAN</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="12" style="width:5%;"></td>
                                                <td style="width:5%;">1.</td>
                                                <td colspan="2" style="width:45%;">Nama</td>
                                                <td colspan="3">{{$data->pegawai->nama}}</td>
                                            </tr>
                                            <tr>
                                                <td>2.</td>
                                                <td colspan="2">NIP</td>
                                                <td colspan="3">{{$data->pegawai->nip}}</td>
                                            </tr>
                                            <tr>
                                                <td>3.</td>
                                                <td colspan="2">Nomor Seri KARPEG</td>
                                                <td colspan="3">{{$data->pegawai->nokartu}}</td>
                                            </tr>
                                            <tr>
                                                <td>4.</td>
                                                <td colspan="2">Pangkat / Golongan Ruang / TMT</td>
                                                <td colspan="3">
                                                    @if($old)
                                                    {{$old->golongan->nama}}, {{$old->golongan->golongan}}, {{Carbon\Carbon::make($old->awal)->translatedFormat('d F Y')}}
                                                    @else
                                                    -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>5.</td>
                                                <td colspan="2">Tempat dan Tanggal Lahir</td>
                                                <td colspan="3">{{$data->pegawai->tempatlahir}}, {{Carbon\Carbon::make($data->pegawai->tanggallahir)->translatedFormat('d F Y')}}</td>
                                            </tr>
                                            <tr>
                                                <td>6.</td>
                                                <td colspan="2">Jenis Kelamin</td>
                                                <td colspan="3">
                                                    @if($data->pegawai->jeniskelamin=='L') Laki-laki
                                                    @elseif($data->pegawai->jeniskelamin=='P') Perempuan
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>7.</td>
                                                <td colspan="2">Pendidikan yang Diperhitungkan Angka Kreditnya</td>
                                                <td colspan="3">{{$data->pendidikan->nama}}</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2">8.</td>
                                                <td colspan="2">Jabatan Fungsional</td>
                                                <td colspan="3">
                                                    @if($old)
                                                    {{$old->jabatan->detail}}
                                                    @else
                                                    -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">TMT</td>
                                                <td colspan="3">
                                                    @if($old)
                                                    {{Carbon\Carbon::make($old->awal)->translatedFormat('d F Y')}}
                                                    @else
                                                    -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2">9.</td>
                                                <td>Masa kerja Golongan</td>
                                                <td>Lama</td>
                                                <td colspan="3">{{ sprintf("%02d", floor($masakerjaold/12)) }} Tahun {{ sprintf("%02d", $masakerjaold%12) }} Bulan</td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td>Baru</td>
                                                <td colspan="3">{{ sprintf("%02d", floor($masakerja/12)) }} Tahun {{ sprintf("%02d", $masakerja%12) }} Bulan</td>
                                            </tr>
                                            <tr>
                                                <td>10.</td>
                                                <td colspan="2">Unit kerja</td>
                                                <td colspan="3">{{$data->unitKerja->nama}}</td>
                                            </tr>
                                        </tbody>
                                        <tbody>
                                            <tr class="fontBold">
                                                <td>II</td>
                                                <td></td>
                                                <td class="fontCenter" colspan="2">PENETAPAN ANGKA KREDIT</td>
                                                <td style="width:15%;">LAMA</td>
                                                <td style="width:15%;">BARU</td>
                                                <td>JUMLAH</td>
                                            </tr>
                                            <tr>
                                                <td rowspan="14"></td>
                                                <td>1.</td>
                                                <td colspan="2" class="fontBold">UNSUR UTAMA</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="9"></td>
                                                <td colspan="2">A. Pendidikan</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr >
                                                <td colspan="2" style="padding-left: 16px;">  (1) Pendidikan formal</td>
                                                <td class="fontCenter">
                                                    @if($old && $old->pendformal>0)
                                                    {{number_format($old->pendformal,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                <td class="fontCenter">
                                                    @if($data->pendformal>0)
                                                    {{number_format($data->pendformal,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                @php
                                                if($old) $jumlahpendformal = $old->pendformal + $data->pendformal;
                                                else $jumlahpendformal = $data->pendformal;
                                                @endphp
                                                <td class="fontCenter">
                                                    @if($jumlahpendformal>0)
                                                    {{number_format($jumlahpendformal,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr >
                                                <td colspan="2" style="padding-left: 16px;">  (2) Pendidikan dan Pelatihan Fungsional/Teknis</td>
                                                <td class="fontCenter">
                                                    @if($old && $old->diklat>0)
                                                    {{number_format($old->diklat,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                <td class="fontCenter">
                                                    @if($data->diklat>0)
                                                    {{number_format($data->diklat,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                @php
                                                if($old) $jumlahdiklat = $old->diklat + $data->diklat;
                                                else $jumlahdiklat = $data->diklat;
                                                @endphp
                                                <td class="fontCenter">
                                                    @if($jumlahdiklat>0)
                                                    {{number_format($jumlahdiklat,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr >
                                                <td colspan="2" style="padding-left: 38px;">   Jabatan Fungsional Perawat</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr >
                                                <td colspan="2" style="padding-left: 16px;">  (3) Pendidikan dan Pelatihan Prajabatan</td>
                                                <td class="fontCenter">
                                                    @if($old && $old->sttpl>0)
                                                    {{number_format($old->sttpl,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                <td class="fontCenter">
                                                    @if($data->sttpl>0)
                                                    {{number_format($data->sttpl,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                @php
                                                if($old) $jumlahsttpl = $old->sttpl + $data->sttpl;
                                                else $jumlahsttpl = $data->sttpl;
                                                @endphp
                                                <td class="fontCenter">
                                                    @if($jumlahsttpl>0)
                                                    {{number_format($jumlahsttpl,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr >
                                                <td colspan="2">B. Pelayanan Kesehatan</td>
                                                <td class="fontCenter">
                                                    @if($old && $old->yankes>0)
                                                    {{number_format($old->yankes,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                <td class="fontCenter">
                                                    @if($data->yankes>0)
                                                    {{number_format($data->yankes,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                @php
                                                if($old) $jumlahyankes = $old->yankes + $data->yankes;
                                                else $jumlahyankes = $data->yankes;
                                                @endphp
                                                <td class="fontCenter">
                                                    @if($jumlahyankes>0)
                                                    {{number_format($jumlahyankes,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr >
                                                <td colspan="2">C. Pengabdian Masyarakat</td>
                                                <td class="fontCenter">
                                                    @if($old && $old->pengmas>0)
                                                    {{number_format($old->pengmas,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                <td class="fontCenter">
                                                    @if($data->pengmas>0)
                                                    {{number_format($data->pengmas,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                @php
                                                if($old) $jumlahpengmas = $old->pengmas + $data->pengmas;
                                                else $jumlahpengmas = $data->pengmas;
                                                @endphp
                                                <td class="fontCenter">
                                                    @if($jumlahpengmas>0)
                                                    {{number_format($jumlahpengmas,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr >
                                                <td colspan="2">D. Pengembangan Profesi</td>
                                                <td class="fontCenter">
                                                    @if($old && $old->profesi>0)
                                                    {{number_format($old->profesi,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                <td class="fontCenter">
                                                    @if($data->profesi>0)
                                                    {{number_format($data->profesi,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                @php
                                                if($old) $jumlahprofesi = $old->profesi + $data->profesi;
                                                else $jumlahprofesi = $data->profesi;
                                                @endphp
                                                <td class="fontCenter">
                                                    @if($jumlahprofesi>0)
                                                    {{number_format($jumlahprofesi,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr >
                                                <td class="fontCenter fontBold" colspan="2">JUMLAH UNSUR UTAMA</td>
                                                @php
                                                if($old) $jumlahutamalama = $old->pendformal + $old->diklat + $old->sttpl + $old->yankes + $old->pengmas + $old->profesi;
                                                else $jumlahutamalama = 0;
                                                $jumlahutamabaru = $data->pendformal + $data->diklat + $data->sttpl + $data->yankes + $data->pengmas + $data->profesi;
                                                @endphp
                                                <td class="fontCenter">
                                                    @if($jumlahutamalama>0)
                                                    {{number_format($jumlahutamalama,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                <td class="fontCenter">
                                                    @if($jumlahutamabaru>0)
                                                    {{number_format($jumlahutamabaru,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                @php
                                                $jumlahutama = $jumlahutamalama + $jumlahutamabaru;
                                                @endphp
                                                <td class="fontCenter">
                                                    @if($jumlahutama>0)
                                                    {{number_format($jumlahutama,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>2.</td>
                                                <td colspan="2" class="fontBold">UNSUR PENUNJANG</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2"></td>
                                                <td colspan="2">Penunjang Pelayanan Kesehatan</td>
                                                <td class="fontCenter">
                                                    @if($old && $old->penyankes>0)
                                                    {{number_format($old->penyankes,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                <td class="fontCenter">
                                                    @if($data->penyankes>0)
                                                    {{number_format($data->penyankes,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                @php
                                                if($old) $jumlahpenyankes = $old->penyankes + $data->penyankes;
                                                else $jumlahpenyankes = $data->penyankes;
                                                @endphp
                                                <td class="fontCenter">
                                                    @if($jumlahpenyankes>0)
                                                    {{number_format($jumlahpenyankes,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr >
                                                <td class="fontCenter fontBold" colspan="2">JUMLAH UNSUR PENUNJANG	</td>
                                                <td class="fontCenter">
                                                    @if($old && $old->penyankes>0)
                                                    {{number_format($old->penyankes,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                <td class="fontCenter">
                                                    @if($data->penyankes>0)
                                                    {{number_format($data->penyankes,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                @php
                                                if($old) $jumlahpenyankes = $old->penyankes + $data->penyankes;
                                                else $jumlahpenyankes = $data->penyankes;
                                                @endphp
                                                <td class="fontCenter">
                                                    @if($jumlahpenyankes>0)
                                                    {{number_format($jumlahpenyankes,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="fontCenter fontBold" colspan="3">JUMLAH UNSUR UTAMA DAN PENUNJANG</td>
                                                <td class="fontCenter">
                                                    @if($old && $jumlahutamalama+$old->penyankes>0)
                                                    {{number_format($jumlahutamalama+$old->penyankes,3)}}
                                                    @elseif($jumlahutamalama>0)
                                                    {{number_format($jumlahutamalama,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                <td class="fontCenter">
                                                    @if($jumlahutamabaru+$data->penyankes>0)
                                                    {{number_format($jumlahutamabaru+$data->penyankes,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                                @php
                                                if($old) $jumlah = $jumlahutama+$old->penyankes+$data->penyankes;
                                                else $jumlah = $jumlahutama+$data->penyankes;
                                                @endphp
                                                <td class="fontCenter">
                                                    @if($jumlah>0)
                                                    {{number_format($jumlah,3)}}
                                                    @else -
                                                    @endif
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tbody>
                                            <tr class="fontBold">
                                                <td>III</td>
                                                <td colspan="6">
                                                @if ($tipe == 'cetak-kp')
                                                    Dapat dipertimbangkan untuk dinaikkan dalam Jabatan {{$data->jabatan->detail}} ; <br>
                                                    Pangkat {{$data->golongan->nama}}; Golongan Ruang {{$data->golongan->golongan}} ; TMT {{Carbon\Carbon::make($data->awal)->translatedFormat('d F Y')}} ; 
                                                @elseif ($tipe == 'cetak-t')
                                                    Penetapan Angka Kredit dalam Jabatan Fungsional {{$data->jabatan->detail}} ; <br>
                                                    Pangkat {{$data->golongan->nama}}; Golongan Ruang {{$data->golongan->golongan}} ;
                                                @elseif ($tipe == 'cetak-f1')
                                                    Penetapan Angka Kredit untuk Pengangkatan Pertama dalam Jabatan Fungsional {{$data->jabatan->detail}} ; <br>
                                                    Pangkat {{$data->golongan->nama}}; Golongan Ruang {{$data->golongan->golongan}} ;
                                                @endif
                                                </td>
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
                                                    2. Kepala {{$data->unitKerja->nama}}<br>
                                                    3. Kepala Badan Kepegawaian dan Diklat Pemerintah Kota Surabaya<br>

                                                </td>
                                                <td class="fontBold">
                                                    DITETAPKAN DI : SURABAYA<br>
                                                    PADA TANGGAL : {{Carbon\Carbon::make($data->dom)->translatedFormat('d M Y')}}<br><br>
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