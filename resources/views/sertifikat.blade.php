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

            <div class="row pb-4">
                <div class="col-md-3"></div>

                <div class="col-md-6 text-center">
                    <h5>Silahkan cari Acara terlebih dahulu dengan klik tombol di bawah ini</h5>
                    <a href="{{route('acara.index')}}" class="btn btn-primary btn-lg mt-3"
                        style="min-width: 40%;">Cari</a>
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
<div class="modal fade" id="modalTambah">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h4 class="modal-title">Tambah Peserta</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('transaksi.add',['idacara'=>$id])}}" method="post" id="formPeserta"
                enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <input type="text" value="{{$acara->iduser}}">
                                <label for="tanggal">Peserta</label>
                                <select class="form-control select2" name="addPeserta[]" multiple="multiple" data-placeholder="Pilih Peserta"
                                    style="width: 100%;">
                                    @foreach($allPeserta as $unit)
                                    <option value="{{$unit->id}}">{{$unit->nama}}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-info">Simpan</button>
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
                                    <b>Jumlah Peserta</b> <a class="float-right">{{isset($acara->jumpeserta) ?
                                        $acara->jumpeserta : '0'}}</a>
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
                            <p class="text-muted">{{\Carbon\Carbon::make($acara->acara->tanggal)->translatedFormat('d F
                                Y')}}</p>
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
                    <div class="card card-info card-outline">
                        <div class="card-header p-2">
                            <div class="row">
                                <div class="col-md-8">
                                    <h3 class="card-title">Data Peserta</h3>
                                </div>
                                <div class="col-md-4 text-right">
                                    <button class="btn btn-primary btn-sm" data-toggle="modal"
                                        data-target="#modalTambah">Tambah Peserta</button>
                                </div>
                            </div>

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
                                        <td>
                                            <a href="{{route('transaksi.cetak',['idacara'=>$acara->idacara, 'idpeserta'=>$unit->id])}}" class="btn btn-info btn-sm"><i class="fas fa-print nav-icon"></i></a>
                                            <button class="btn btn-danger btn-sm"><i class="fas fa-trash nav-icon"></i></button>
                                        </td>
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

    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

    });

    $('#formAbsenMasuk').one('submit', function () {
        $(this).find('button[type="submit"]').attr('disabled', true);
    });

    $('#formIzin').one('submit', function () {
        $(this).find('button[type="submit"]').attr('disabled', true);
    });

    $('.select2').select2({
        theme: 'bootstrap4',
    });

</script>
@endsection