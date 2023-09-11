@extends('layouts.layout')

@section('masterShow')
menu-open
@endsection

@section('userStatus')
active
@endsection

@section('content')
<!-- Modal Tambah User -->
<div class="modal modal-danger fade" id="tambah" tabindex="-1" role="dialog" aria-labelledby="Tambah User"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Tambah User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('user.store')}}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="d-block"><b>Unit Kerja</b></label>
                                <select class="form-control select2" name="idunitkerja" required>
                                    <option value="">--Pilih--</option>
                                    <option value="1">Dinas Kesehatan Kota Surabaya, DKK</option>
                                    <!-- <option value="2">Bagian Sekretariat, SEKRETARIAT</option>
                                    <option value="3">Sub. Bag. Penyusunan Program, SUNGRAM</option>
                                    <option value="4">Sub. Bag. Tata Usaha, TU</option>
                                    <option value="5">UNIT PEGAWAIAN, UP</option>
                                    <option value="6">Sub. Bag. Keuangan dan Perlengkapan, KEUANGAN</option>
                                    <option value="7">INFORMASI TEKNOLOGI, IT</option>
                                    <option value="8">SISTEM INFORMASI KESEHATAN, SIK</option>
                                    <option value="9">PERIJINAN, PERIJINAN</option>
                                    <option value="10">KONSULTAN, KONSULTAN</option>
                                    <option value="11">GUDANG, GUDANG</option>
                                    <option value="12">PERPUSTAKAAN, PERPUSTAKAAN</option>
                                    <option value="13">SEKPRO, SEKPRO</option>
                                    <option value="14">AMBULAN, AMBULAN</option>
                                    <option value="15">KEAMANAN, KEAMANAN</option>
                                    <option value="16">SEKRETARIS DINAS,SEKRETARIS  DINAS</option>
                                    <option value="17">Bidang Pelayanan Kesehatan, YANKES</option>
                                    <option value="18">Seksi Pelayanan Kesehatan Dasar, YANKESDAS</option>
                                    <option value="19">Seksi Pelayanan Kesehatan Khusus, YANKESKHUSUS</option>
                                    <option value="20">Seksi Pelayanan Kesehatan Rujukan, YANKESRUJUKAN</option>
                                    <option value="21">Bidang Pengembangan SDM Kesehatan, PSDMK</option>
                                    <option value="22">Seksi Perencanaan dan Pendayagunaan SDM Kesehatan, PSDMPERENCANAAN</option>
                                    <option value="23">Seksi Pendidikan dan Pelatihan SDM Kesehatan, PSDMPENDIDIKAN</option>
                                    <option value="24">Seksi Registrasi dan Akreditasi SDM Kesehatan, PSDMREGISTRASI</option>
                                    <option value="25">Bidang Jaminan Dan Sarana Kesehatan, JAMSARKES</option>
                                    <option value="26">Seksi Jaminan Kesehatan, JAMKESMAS</option>
                                    <option value="27">Seksi Kefarmasian, FARMASI</option>
                                    <option value="28">Seksi Sarana dan Peralatan Kesehatan, SARALKES</option>
                                    <option value="30">Bidang Pengendalian Masalah Kesehatan, PMK</option>
                                    <option value="31">Seksi Pengendalian dan Pemberantasan Penyakit, P2P</option>
                                    <option value="32">Seksi Wabah dan Bencana, WABEN</option>
                                    <option value="33">Seksi Kesehatan Lingkungan, KESLING</option>
                                    <option value="34">IMUNISASI, IMUNISASI</option>
                                    <option value="35">PONDOK ASI,PONDOK  ASI</option> -->
                                    <option value="37">Laboratorium Kesehatan Daerah Kota Surabaya,LAB DKK</option>
                                    <option value="38">Puskesmas Tanjungsari, TANJUNGSARI</option>
                                    <option value="39">Puskesmas Simomulyo, SIMOMULYO</option>
                                    <option value="40">Puskesmas Manukan Kulon, MANUKANKULON</option>
                                    <option value="41">Puskesmas Balongsari, BALONGSARI</option>
                                    <option value="42">Puskesmas Asemrowo, ASEMROWO</option>
                                    <option value="43">Puskesmas Sememi, SEMEMI</option>
                                    <option value="44">Puskesmas Benowo, BENOWO</option>
                                    <option value="45">Puskesmas Jeruk, JERUK</option>
                                    <option value="46">Puskesmas Lidah Kulon, LIDAHKULON</option>
                                    <option value="47">Puskesmas Lontar, LONTAR</option>
                                    <option value="48">Puskesmas Peneleh, PENELEH</option>
                                    <option value="49">Puskesmas Ketabang, KETABANG</option>
                                    <option value="50">Puskesmas Kedungdoro, KEDUNGDORO</option>
                                    <option value="51">Puskesmas Dr. Soetomo, DRSOETOMO</option>
                                    <option value="52">Puskesmas Tembok Dukuh, TEMBOKDUKUH</option>
                                    <option value="53">Puskesmas Gundih, GUNDIH</option>
                                    <option value="54">Puskesmas Tambakrejo, TAMBAKREJO</option>
                                    <option value="55">Puskesmas Simolawang, SIMOLAWANG</option>
                                    <option value="56">Puskesmas Perak Timur, PERAKTIMUR</option>
                                    <option value="57">Puskesmas Pegirian, PEGIRIAN</option>
                                    <option value="58">Puskesmas Sidotopo, SIDOTOPO</option>
                                    <option value="59">Puskesmas Wonokusumo, WONOKUSUMO</option>
                                    <option value="60">Puskesmas Krembangan Selatan, KREMBANGANSELATAN</option>
                                    <option value="61">Puskesmas Dupak, DUPAK</option>
                                    <option value="62">Puskesmas Kenjeran, KENJERAN</option>
                                    <option value="63">Puskesmas Tanah Kali Kedinding, TAKAL</option>
                                    <option value="64">Puskesmas Sidotopo Wetan, SIDOTOPOWETAN</option>
                                    <option value="65">Puskesmas Rangkah, RANGKAH</option>
                                    <option value="66">Puskesmas Pacar Keling, PACARKELING</option>
                                    <option value="67">Puskesmas Gading, GADING</option>
                                    <option value="68">Puskesmas Pucangsewu, PUCANGSEWU</option>
                                    <option value="69">Puskesmas Mojo, MOJO</option>
                                    <option value="70">Puskesmas Kalirungkut, KALIRUNGKUT</option>
                                    <option value="71">Puskesmas Medokan Ayu, MEDOKANAYU</option>
                                    <option value="72">Puskesmas Tenggilis, TENGGILIS</option>
                                    <option value="73">Puskesmas Gunung Anyar, GUNUNGANYAR</option>
                                    <option value="74">Puskesmas Menur, MENUR</option>
                                    <option value="75">Puskesmas Klampis Ngasem, KLAMPISNGASEM</option>
                                    <option value="76">Puskesmas Mulyorejo, MULYOREJO</option>
                                    <option value="77">Puskesmas Sawahan, SAWAHAN</option>
                                    <option value="78">Puskesmas Putat Jaya, PUTATJAYA</option>
                                    <option value="79">Puskesmas Banyu Urip, BANYUURIP</option>
                                    <option value="80">Puskesmas Pakis, PAKIS</option>
                                    <option value="81">Puskesmas Jagir, JAGIR</option>
                                    <option value="82">Puskesmas Wonokromo, WONOKROMO</option>
                                    <option value="83">Puskesmas Ngagel Rejo, NGAGELREJO</option>
                                    <option value="84">Puskesmas Kedurus, KEDURUS</option>
                                    <option value="85">Puskesmas Dukuh Kupang, DUKUHKUPANG</option>
                                    <option value="86">Puskesmas Wiyung, WIYUNG</option>
                                    <option value="87">Puskesmas Gayungan, GAYUNGAN</option>
                                    <option value="88">Puskesmas Jemursari, JEMURSARI</option>
                                    <option value="89">Puskesmas Sidosermo, SIDOSERMO</option>
                                    <option value="90">Puskesmas Kebonsari, KEBONSARI</option>
                                    <option value="103">Puskesmas Bangkingan, BANGKINGAN</option>
                                    <option value="104">Puskesmas Made, MADE</option>
                                    <option value="117">Puskesmas Moro Krembangan , MOROKREMBANGAN</option>
                                    <option value="121">Puskesmas Tambak Wedi, TAMBAKWEDI</option>
                                    <option value="122">Puskesmas Bulak Banteng, BULAKBANTENG</option>
                                    <option value="135">Puskesmas Keputih, KEPUTIH</option>
                                    <option value="138">Puskesmas Kalijudan, KALIJUDAN</option>
                                    <option value="148">Puskesmas Balas Klumprik, BALASKLUMPRIK</option>
                                    <option value="151">Puskesmas Siwalankerto, SIWALANKERTO</option>
                                    <option value="984">Puskesmas Sawah Pulo, SAWAHPULO</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><b>Role</b></label>
                                <select class="selectpicker" data-style-base="form-control" data-style=""
                                    data-live-search="true" name="role" required>
                                    <option value="">--Pilih--</option>
                                    <option value="admin">Admin</option>
                                    <option value="user">User</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label><b>Nama</b></label>
                        <input type="text" id="nama" name="nama" class="form-control" placeholder="Nama" required>
                    </div>
                    <div class="form-group">
                        <label><b>Username</b></label>
                        <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><b>Password</b></label>
                                <input type="password" id="password" name="password" class="form-control"
                                    placeholder="Password" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label><b>Konfirmasi Password</b></label>
                                <input type="password" id="password_confirmation" name="password_confirmation"
                                    class="form-control" placeholder="Password" required>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="form-group">
                    <label><b>Status</b></label>
                    <div class="custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input" id="isactive" name="isactive">
                        <label class="custom-control-label" for="isactive"></label>
                        <label class="custom-control-status-1" for="isactive"></label>
                    </div>
                </div>   -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Sunting User -->
<div class="modal modal-danger fade" id="sunting" tabindex="-1" role="dialog" aria-labelledby="Sunting User"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="suntingLabel">Sunting User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('user.update', ['id'=>'0'])}}" method="POST">
                @csrf
                @method('PUT')
                <input type="hidden" name="id">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="idunitkerja"><b>Unit Kerja</b></label>
                                <select class="form-control select2" name="idunitkerja" required>
                                    <option value="">--Pilih--</option>
                                    <option value="1">Dinas Kesehatan Kota Surabaya, DKK</option>
                                    <!-- <option value="2">Bagian Sekretariat, SEKRETARIAT</option>
                                    <option value="3">Sub. Bag. Penyusunan Program, SUNGRAM</option>
                                    <option value="4">Sub. Bag. Tata Usaha, TU</option>
                                    <option value="5">UNIT PEGAWAIAN, UP</option>
                                    <option value="6">Sub. Bag. Keuangan dan Perlengkapan, KEUANGAN</option>
                                    <option value="7">INFORMASI TEKNOLOGI, IT</option>
                                    <option value="8">SISTEM INFORMASI KESEHATAN, SIK</option>
                                    <option value="9">PERIJINAN, PERIJINAN</option>
                                    <option value="10">KONSULTAN, KONSULTAN</option>
                                    <option value="11">GUDANG, GUDANG</option>
                                    <option value="12">PERPUSTAKAAN, PERPUSTAKAAN</option>
                                    <option value="13">SEKPRO, SEKPRO</option>
                                    <option value="14">AMBULAN, AMBULAN</option>
                                    <option value="15">KEAMANAN, KEAMANAN</option>
                                    <option value="16">SEKRETARIS DINAS,SEKRETARIS DINAS</option>
                                    <option value="17">Bidang Pelayanan Kesehatan, YANKES</option>
                                    <option value="18">Seksi Pelayanan Kesehatan Dasar, YANKESDAS</option>
                                    <option value="19">Seksi Pelayanan Kesehatan Khusus, YANKESKHUSUS</option>
                                    <option value="20">Seksi Pelayanan Kesehatan Rujukan, YANKESRUJUKAN</option>
                                    <option value="21">Bidang Pengembangan SDM Kesehatan, PSDMK</option>
                                    <option value="22">Seksi Perencanaan dan Pendayagunaan SDM Kesehatan,
                                        PSDMPERENCANAAN</option>
                                    <option value="23">Seksi Pendidikan dan Pelatihan SDM Kesehatan, PSDMPENDIDIKAN
                                    </option>
                                    <option value="24">Seksi Registrasi dan Akreditasi SDM Kesehatan, PSDMREGISTRASI
                                    </option>
                                    <option value="25">Bidang Jaminan Dan Sarana Kesehatan, JAMSARKES</option>
                                    <option value="26">Seksi Jaminan Kesehatan, JAMKESMAS</option>
                                    <option value="27">Seksi Kefarmasian, FARMASI</option>
                                    <option value="28">Seksi Sarana dan Peralatan Kesehatan, SARALKES</option>
                                    <option value="30">Bidang Pengendalian Masalah Kesehatan, PMK</option>
                                    <option value="31">Seksi Pengendalian dan Pemberantasan Penyakit, P2P</option>
                                    <option value="32">Seksi Wabah dan Bencana, WABEN</option>
                                    <option value="33">Seksi Kesehatan Lingkungan, KESLING</option>
                                    <option value="34">IMUNISASI, IMUNISASI</option>
                                    <option value="35">PONDOK ASI,PONDOK ASI</option> -->
                                    <option value="37">Laboratorium Kesehatan Daerah Kota Surabaya,LAB DKK</option>
                                    <option value="38">Puskesmas Tanjungsari, TANJUNGSARI</option>
                                    <option value="39">Puskesmas Simomulyo, SIMOMULYO</option>
                                    <option value="40">Puskesmas Manukan Kulon, MANUKANKULON</option>
                                    <option value="41">Puskesmas Balongsari, BALONGSARI</option>
                                    <option value="42">Puskesmas Asemrowo, ASEMROWO</option>
                                    <option value="43">Puskesmas Sememi, SEMEMI</option>
                                    <option value="44">Puskesmas Benowo, BENOWO</option>
                                    <option value="45">Puskesmas Jeruk, JERUK</option>
                                    <option value="46">Puskesmas Lidah Kulon, LIDAHKULON</option>
                                    <option value="47">Puskesmas Lontar, LONTAR</option>
                                    <option value="48">Puskesmas Peneleh, PENELEH</option>
                                    <option value="49">Puskesmas Ketabang, KETABANG</option>
                                    <option value="50">Puskesmas Kedungdoro, KEDUNGDORO</option>
                                    <option value="51">Puskesmas Dr. Soetomo, DRSOETOMO</option>
                                    <option value="52">Puskesmas Tembok Dukuh, TEMBOKDUKUH</option>
                                    <option value="53">Puskesmas Gundih, GUNDIH</option>
                                    <option value="54">Puskesmas Tambakrejo, TAMBAKREJO</option>
                                    <option value="55">Puskesmas Simolawang, SIMOLAWANG</option>
                                    <option value="56">Puskesmas Perak Timur, PERAKTIMUR</option>
                                    <option value="57">Puskesmas Pegirian, PEGIRIAN</option>
                                    <option value="58">Puskesmas Sidotopo, SIDOTOPO</option>
                                    <option value="59">Puskesmas Wonokusumo, WONOKUSUMO</option>
                                    <option value="60">Puskesmas Krembangan Selatan, KREMBANGANSELATAN</option>
                                    <option value="61">Puskesmas Dupak, DUPAK</option>
                                    <option value="62">Puskesmas Kenjeran, KENJERAN</option>
                                    <option value="63">Puskesmas Tanah Kali Kedinding, TAKAL</option>
                                    <option value="64">Puskesmas Sidotopo Wetan, SIDOTOPOWETAN</option>
                                    <option value="65">Puskesmas Rangkah, RANGKAH</option>
                                    <option value="66">Puskesmas Pacar Keling, PACARKELING</option>
                                    <option value="67">Puskesmas Gading, GADING</option>
                                    <option value="68">Puskesmas Pucangsewu, PUCANGSEWU</option>
                                    <option value="69">Puskesmas Mojo, MOJO</option>
                                    <option value="70">Puskesmas Kalirungkut, KALIRUNGKUT</option>
                                    <option value="71">Puskesmas Medokan Ayu, MEDOKANAYU</option>
                                    <option value="72">Puskesmas Tenggilis, TENGGILIS</option>
                                    <option value="73">Puskesmas Gunung Anyar, GUNUNGANYAR</option>
                                    <option value="74">Puskesmas Menur, MENUR</option>
                                    <option value="75">Puskesmas Klampis Ngasem, KLAMPISNGASEM</option>
                                    <option value="76">Puskesmas Mulyorejo, MULYOREJO</option>
                                    <option value="77">Puskesmas Sawahan, SAWAHAN</option>
                                    <option value="78">Puskesmas Putat Jaya, PUTATJAYA</option>
                                    <option value="79">Puskesmas Banyu Urip, BANYUURIP</option>
                                    <option value="80">Puskesmas Pakis, PAKIS</option>
                                    <option value="81">Puskesmas Jagir, JAGIR</option>
                                    <option value="82">Puskesmas Wonokromo, WONOKROMO</option>
                                    <option value="83">Puskesmas Ngagel Rejo, NGAGELREJO</option>
                                    <option value="84">Puskesmas Kedurus, KEDURUS</option>
                                    <option value="85">Puskesmas Dukuh Kupang, DUKUHKUPANG</option>
                                    <option value="86">Puskesmas Wiyung, WIYUNG</option>
                                    <option value="87">Puskesmas Gayungan, GAYUNGAN</option>
                                    <option value="88">Puskesmas Jemursari, JEMURSARI</option>
                                    <option value="89">Puskesmas Sidosermo, SIDOSERMO</option>
                                    <option value="90">Puskesmas Kebonsari, KEBONSARI</option>
                                    <option value="103">Puskesmas Bangkingan, BANGKINGAN</option>
                                    <option value="104">Puskesmas Made, MADE</option>
                                    <option value="117">Puskesmas Moro Krembangan , MOROKREMBANGAN</option>
                                    <option value="121">Puskesmas Tambak Wedi, TAMBAKWEDI</option>
                                    <option value="122">Puskesmas Bulak Banteng, BULAKBANTENG</option>
                                    <option value="135">Puskesmas Keputih, KEPUTIH</option>
                                    <option value="138">Puskesmas Kalijudan, KALIJUDAN</option>
                                    <option value="148">Puskesmas Balas Klumprik, BALASKLUMPRIK</option>
                                    <option value="151">Puskesmas Siwalankerto, SIWALANKERTO</option>
                                    <option value="984">Puskesmas Sawah Pulo, SAWAHPULO</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label><b>Role</b></label>
                                <select class="form-control" data-live-search="true" name="role" required>
                                    <option value="" disabled selected>--Pilih--</option>
                                    <option value="user">User</option>
                                    <option value="admin">Admin</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label><b>Nama</b></label>
                        <input type="text" name="nama" class="form-control" placeholder="Nama" required>
                    </div>
                    <div class="form-group">
                        <label><b>Username</b></label>
                        <input type="text" class="form-control" name="username" placeholder="Username"
                            disabled="disabled">
                    </div>
                    <!-- <div class="form-group">
                    <label><b>Status</b></label>
                    <div class="custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input" id="isactive" name="isactive">
                        <label class="custom-control-label" for="isactive"></label>
                        <label class="custom-control-status-1" for="isactive"></label>
                    </div>
                </div>   -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Hapus User -->
<div class="modal modal-primary fade" id="hapus" tabindex="-1" role="dialog" aria-labelledby="myDeleteModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="suntingLabel">Hapus User</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('user.destroy', ['user'=>''])}}" method="POST">
                @method('DELETE')
                @csrf
                <div class="modal-body text-center">
                    <p>Yakin ingin menghapus?</p>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tidak</button>
                    <button type="submit" class="btn btn-danger">Ya, Hapus
                        <div class="ripple-container"></div>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--  end modal Hapus User -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="@if(!Auth::user())margin-left: 0; @endif">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <!-- <h1 class="m-0">Tampilan Awal</h1> -->
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Data Master</a></li>
                        <li class="breadcrumb-item active">User</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">User</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Nama</th>
                                <th>Unit Kerja</th>
                                <th>Username</th>
                                <th>Role</th>
                                <th>Aksi</th>
                                <th hidden>idunitkerja</th>
                                <th hidden>ID</th>
                                <th hidden>role</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($user as $key=>$unit)
                            <tr>
                                <td>{{$unit->nama}}</td>
                                <td>{{isset($unit->idunitkerja) ? $unit->unitKerja->nama : ''}}</td>
                                <td>{{$unit->username}}</td>
                                <td>
                                    @if($unit->role=='admin')
                                    <span class="badge badge-warning">Admin</span>
                                    @elseif($unit->role=='user')
                                    <span class="badge badge-info">User</span>
                                    @endif
                                </td>
                                <td>
                                    @if($unit->nama=='Admin')
                                    <button class="btn btn-sm btn-outline-danger border-0" disabled><i
                                            class="fas fa-lock fa-sm"></i></button>
                                    @else
                                    <button onclick="edit(this)" class="btn btn-sm btn-outline-warning border-0"
                                        data-toggle="modal" data-target="#sunting" data-placement="top" title="sunting"
                                        key="{{$key}}"><i class="fas fa-edit fa-sm"></i></button>
                                    <button onclick="hapus({{$unit->id}})" class="btn btn-sm btn-outline-danger border-0"
                                        title="delete"><i class="fas fa-trash fa-sm"></i></button>
                                    @endif
                                </td>
                                <td hidden>{{$unit->idunitkerja}}</td>
                                <td hidden>{{$unit->id}}</td>
                                <td hidden>{{$unit->role}}</td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Nama</th>
                                <th>Unit Kerja</th>
                                <th>Username</th>
                                <th>Role</th>
                                <th>Aksi</th>
                                <th hidden>idunitkerja</th>
                                <th hidden>ID</th>
                                <th hidden>role</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->

        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</div>
<!-- /.content-wrapper -->

@endsection

@section('script')
@include('layouts.alert')
<!-- DataTables  & Plugins -->
<script src="{{asset('public/plugins/datatables/jquery.dataTables.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-buttons/js/dataTables.buttons.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-buttons/js/buttons.bootstrap4.min.js')}}"></script>
<script src="{{asset('public/plugins/jszip/jszip.min.js')}}"></script>
<script src="{{asset('public/plugins/pdfmake/pdfmake.min.js')}}"></script>
<script src="{{asset('public/plugins/pdfmake/vfs_fonts.js')}}"></script>
<script src="{{asset('public/plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>
<script src="{{asset('public/plugins/datatables-buttons/js/buttons.colVis.min.js')}}"></script>

<script>
    var myUsers = @json($user);

    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        
        $(".select2").select2({
            theme: 'bootstrap4'
        });
    });

    function show(self) {
        var $modal = $('#sunting');
        var key = $(self).attr('key');
        var j = myUsers[key];

        window.location.href = "{{url('/str')}}/" + data['id'];
    }

    function edit(self) {
        var $modal = $('#sunting');
        var key = $(self).attr('key');
        var j = myUsers[key];

        $modal.find('input[name=id]').val(j['id']);
        $modal.find('select[name=idunitkerja]').val(j['idunitkerja']).change();
        $modal.find('input[name=username]').val(j['username']).change();
        $modal.find('input[name=nama]').val(j['nama']).change();
        $modal.find('select[name=isactive]').val(j['isactive']).change();
        $modal.find('select[name=role]').val(j['role']).change();

        $modal.modal('show');
    }

    function hapus(id) {
        $modal = $('#hapus');

        $modal.find('form').attr('action', "{{route('user.destroy', ['id'=>''])}}/" + id);
        $modal.modal('show');
    }


</script>
@endsection