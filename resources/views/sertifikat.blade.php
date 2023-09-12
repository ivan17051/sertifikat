@extends('layouts.layout')

@section('sertifikatStatus')
active
@endsection

@section('content')

@if($id==0)
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <!-- <h1 class="m-0">Tampilan Awal</h1> -->
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
                        <li class="breadcrumb-item active">Sertifikat</li>
                    </ol>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <!-- Small boxes (Stat box) -->
            <!-- <h3 style="text-align:center;">Selamat Datang</h3> -->
            <!-- <h2 style="text-align:center;">{{Auth::user()->nama}}</h2> -->
            <!-- <h5 style="text-align:center;padding-bottom: 20px;">Puskesmas Asemrowo</h5> -->
            <div class="row pb-4">
                <div class="col-md-3"></div>
                <div class="col-md-6 text-center">
                    <h5>Silahkan cari Acara terlebih dahulu dengan klik tombol di bawah ini</h5>
                    <a href="{{route('acara.index')}}" class="btn btn-primary btn-lg mt-3"
                        style="min-width: 50%;">Cari</a>
                    <h5 class="mt-4 mb-3 text-primary"><b>ATAU</b></h5>
                    <h5>Cari dari pilihan Acara di bawah</h5>
                    <form action="{{route('acara.show',['id'=>''])}}/0" method="get">
                        <div class="row mt-3">
                            <div class="col-md-9">
                                <select name="idacara" id="idacara" class="form-control select2">
                                    <option value="">--Pilih--</option>
                                    @foreach($acara as $unit)
                                    <option value="{{$unit->id}}">{{$unit->tanggal}} | {{$unit->nama}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-primary btn-block">Lihat</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-3"></div>
            </div>
            <!-- /.row -->

        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</div>
<!-- /.content-wrapper -->

@else
<div class="modal fade" id="modalAbsenMasuk">
    <div class="modal-dialog @if(isset($absen->geotag_msk)) modal-lg @endif">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h4 class="modal-title">Absensi Masuk</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('acara.store')}}" method="post" id="formAbsenMasuk" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">

                    <input type="hidden" name="idpoli" id="inputidpoli">
                    <div class="row">
                        <div class="@if(isset($absen->geotag_msk)) col-md-5 @else col-md-12 @endif">
                            <div class="form-group">
                                <label for="tanggal">Tanggal</label>
                                <input type="date" class="form-control" name="tanggal" style="font-size: 20px;"
                                    value="{{date('Y-m-d')}}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="tanggal">Waktu</label>
                                <small>(Silahkan isi dengan waktu pada foto geotag)</small>
                                <input type="time" class="form-control" name="jam_msk" style="font-size: 20px;"
                                    value="{{isset($absen) ? $absen->jam_msk : ''}}" step="1"
                                    @if(isset($absen->jam_msk)) disabled @endif required>
                            </div>
                            @if(!isset($absen->geotag_msk))
                            <div class="form-group">
                                <label for="geotag_msk">Upload Foto Geotag</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="geotag_msk" name="geotag_msk"
                                            required>
                                        <label class="custom-file-label" for="geotag_msk">Pilih Foto</label>
                                    </div>
                                </div>

                            </div>
                            @else
                            <div class="form-group">
                                <label for="doc">Waktu Upload</label>
                                <input type="text" class="form-control" name="doc" style="font-size: 20px;"
                                    value="{{$absen->doc}}" disabled>
                            </div>
                            @endif
                        </div>
                        @if(isset($absen->geotag_msk))
                        <div class="col-md-7">
                            <img src="{{$absen->geotag_msk}}" alt="Foto" class="img-fluid rounded-start">
                        </div>
                        @endif
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                    @if(!isset($absen->status) || $absen->status == 0)
                    <button type="submit" class="btn btn-info">Simpan</button>
                    @endif
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="modalAbsenPulang">
    <div class="modal-dialog @if(isset($absen->geotag_plg)) modal-lg @endif">
        <div class="modal-content">
            <div class="modal-header bg-success">
                <h4 class="modal-title">Absensi Pulang</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('acara.update', ['id'=>''])}}/{{isset($absen->id) ? $absen->id : 0}}" method="post"
                id="formAbsenPulang" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="modal-body">

                    <!-- <input type="hidden" name="id" id="inputid"> -->
                    <div class="row">
                        <div class="@if(isset($absen->geotag_plg)) col-md-5 @else col-md-12 @endif">
                            <div class="form-group">
                                <label for="tanggal">Tanggal</label>
                                <input type="date" class="form-control" name="tanggal" style="font-size: 20px;"
                                    value="{{date('Y-m-d')}}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="jam_plg">Waktu</label>
                                <small>(Silahkan isi dengan waktu pada foto geotag)</small>
                                <input type="time" class="form-control" name="jam_plg" style="font-size: 20px;"
                                    value="{{isset($absen->jam_plg) ? $absen->jam_plg : ''}}" step="1"
                                    @if(isset($absen->jam_plg)) disabled @endif required>
                            </div>
                            @if(!isset($absen->geotag_plg))
                            <div class="form-group">
                                <label for="geotag_plg">Upload Foto Geotag</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="geotag_plg" name="geotag_plg"
                                            required>
                                        <label class="custom-file-label" for="geotag_plg">Pilih Foto</label>
                                    </div>
                                </div>

                            </div>
                            @else
                            <div class="form-group">
                                <label for="jam_plg">Waktu Upload</label>
                                <input type="text" class="form-control" name="dom" style="font-size: 20px;"
                                    value="{{$absen->dom}}" disabled>
                            </div>
                            @endif

                        </div>
                        @if(isset($absen->geotag_plg))
                        <div class="col-md-7">
                            <img src="{{$absen->geotag_plg}}" alt="Foto" class="img-fluid rounded-start">
                        </div>
                        @endif
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    @if(isset($absen->status) && $absen->status == 1)
                    <button type="submit" class="btn btn-success">Simpan</button>
                    @endif
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Sertifikat</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">Sertifikat</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">

                    <!-- Profile Image -->
                    <div class="card card-primary card-outline">
                        <div class="card-body box-profile">
                            <h3 class="profile-username text-center">{{$acara->acara->nama}}</h3>

                            <p class="text-muted text-center">{{$acara->acara->kategori}}</p>

                            <ul class="list-group list-group-unbordered mb-3">
                                <li class="list-group-item">
                                    <b>Jumlah Peserta</b> <a class="float-right">{{$acara->jumpeserta}}</a>
                                </li>
                            </ul>

                            <a href="#" class="btn btn-primary btn-block"><b>Upload Background</b></a>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                    <!-- About Me Box -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">Tentang</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <strong><i class="fas fa-calendar mr-1"></i> Tanggal</strong>

                            <p class="text-muted">
                                {{\Carbon\Carbon::make($acara->acara->tanggal)->translatedFormat('d F Y')}}
                            </p>

                            <hr>

                            <strong><i class="fas fa-map-marker-alt mr-1"></i> Lokasi</strong>

                            <p class="text-muted">{{$acara->acara->tempat}}</p>

                            <hr>

                            <strong><i class="fas fa-pencil-alt mr-1"></i> Nomor</strong>

                            <p class="text-muted">{{$acara->acara->nomor}}</p>

                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
                <div class="col-md-9">
                    <div class="card">
                        <div class="card-header p-2">
                            <h3 class="card-title">Data Peserta</h3>
                        </div><!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>Nama</th>
                                        <th>Unit Kerja</th>
                                        <th>Jabatan</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($peserta as $unit)
                                    <tr>
                                        <td>{{$unit->nama}}</td>
                                        <td>{{$unit->unitkerja}}</td>
                                        <td>{{$unit->jabatan}}</td>
                                        <td></td>
                                    </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Nama</th>
                                        <th>Unit Kerja</th>
                                        <th>Jabatan</th>
                                        <th>Aksi</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div><!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
@endif

@endsection

@section('script')
<script>
    $(function () {
        bsCustomFileInput.init();
    });

    function submit(idpoli) {
        if (idpoli == 1) {
            $('#modalAbsenMasuk').modal('show');
        } else if (idpoli == 2) {
            $('#modalAbsenPulang').modal('show');
        } else if (idpoli == 3) {
            $('#modalIzin').modal('show');
        }
        // $('#formantrian').submit();
    }

    function cektipepasien(e) {

        if (e == 'umum') {
            $('#formbpjs').attr('hidden', true);
            $('#nobpjs').attr('required', false);

        } else if (e == 'bpjs') {
            $('#formbpjs').attr('hidden', false);
            $('#nobpjs').attr('required', true);
        }
    }

    $('#formAbsenMasuk').one('submit', function () {
        $(this).find('button[type="submit"]').attr('disabled', true);
    });
    $('#formIzin').one('submit', function () {
        $(this).find('button[type="submit"]').attr('disabled', true);
    });
    $('.select2').select2({
        theme: bootstrap4,
    });

</script>
@endsection