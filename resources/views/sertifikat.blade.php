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
                    <h5>Silahkan cari Acara terlebih dahulu dari pilihan di bawah</h5>
                    <form action="{{route('acara.show',['id'=>''])}}/0" method="get">
                        <div class="row mt-3">
                            <div class="col-md-9">
                                <select name="idacara" id="idacara" class="form-control select2">
                                    <option value="">--Pilih--</option>
                                    @foreach($acara as $unit)
                                    <option value="{{$unit->id}}">{{$unit->tgl_mulai}} | {{$unit->nama}}</option>
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
<div class="modal fade" id="modalEdit">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-warning">
                <h4 class="modal-title">Edit Data</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('transaksi.update',['id'=>$acara->id])}}" method="post" id="formData"
                enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tgl_surat">Tanggal Sertifikat</label>
                                <input type="date" class="form-control" name="tgl_surat" value="{{$acara->tgl_surat}}">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="no_surat">Nomor Sertifikat</label>
                                <input type="text" class="form-control" name="no_surat" value="{{$acara->no_surat}}">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="background">Jenis Sertifikat</label>
                                <select name="jns_sertif" id="jns_sertif" class="form-control select2">
                                    <option value="" @if(isset($acara->jns_sertif)) selected @endif disabled> --Pilih-- </option>
                                    <option value="1" @if($acara->jns_sertif == 1) selected @endif>Layak Higiene Sanitasi Makanan</option>
                                    <option value="2" @if($acara->jns_sertif == 2) selected @endif>Pelatihan Tenaga Kesehatan</option>
                                    <option value="3" @if($acara->jns_sertif == 3) selected @endif>Piagam Penghargaan</option>
                                    <option value="4" @if($acara->jns_sertif == 4) selected @endif>Umum</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-warning">Simpan</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="modalHapus">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-danger">
                <h4 class="modal-title">Hapus Peserta</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" method="post" id="formHapus"
                enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    Yakin ingin hapus?
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-danger">Hapus</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="modalLihat">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h4 class="modal-title">Background 1 Sertifikat</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('transaksi.upload',['id'=>$acara->id, 'key'=>1])}}" method="post" id="formLihat" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    @if(isset($acara->background))
                    <img src="{{asset($acara->background)}}" alt="" style="width: 100%;">
                    @endif
                    <div class="form-group">
                        <label for="background">Upload Background</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="background" name="background">
                                <label class="custom-file-label" for="background">Pilih Foto</label>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="modalLihat2">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-secondary">
                <h4 class="modal-title">Background 2 Sertifikat</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('transaksi.upload',['id'=>$acara->id, 'key'=>2])}}" method="post" id="formLihat" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    @if(isset($acara->background2))
                    <img src="{{asset($acara->background2)}}" alt="" style="width: 100%;">
                    @endif
                    <div class="form-group">
                        <label for="background">Upload Background 2</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="background2" name="background2">
                                <label class="custom-file-label" for="background2">Pilih Foto</label>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-secondary">Simpan</button>
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
                            <div class="btn-group btn-block" role="group" aria-label="Basic example">
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalLihat">Background 1</button>
                                <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#modalLihat2">Background 2</button>
                            </div>
                            <!-- <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#modalLihat"><b>Background</b></button> -->
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                    <!-- About Me Box -->
                    <div class="card card-warning">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="card-title">Tentang</h3>
                                </div>
                                <div class="col-md-6 text-right">
                                    <button class="btn btn-outline-dark btn-sm" data-toggle="modal" data-target="#modalEdit"><i class="fas fa-pencil-alt"></i> Edit</button>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <strong><i class="fas fa-calendar mr-1"></i> Tanggal Acara</strong>
                            <p class="text-muted">{{\Carbon\Carbon::make($acara->acara->tgl_mulai)->translatedFormat('d M Y')}} - 
                                {{\Carbon\Carbon::make($acara->acara->tgl_selesai)->translatedFormat('d M Y')}}</p>
                            <hr>

                            <strong><i class="fas fa-map-marker-alt mr-1"></i> Lokasi Acara</strong>
                            <p class="text-muted">{{$acara->acara->tempat}}</p>
                            <hr>

                            <strong><i class="fas fa-pencil-alt mr-1"></i> Nomor Sertifikat</strong>
                            <p class="text-muted">{{isset($acara->no_surat) ? $acara->no_surat : '-'}}</p> 
                            <hr>

                            <strong><i class="fas fa-calendar-check mr-1"></i> Tanggal Sertifikat</strong>
                            <p class="text-muted">{{isset($acara->tgl_surat) ? \Carbon\Carbon::make($acara->tgl_surat)->translatedFormat('d M Y') : '-'}}</p>
                            <hr>
                            
                            <strong><i class="fas fa-bars mr-1"></i> Jenis Sertifikat</strong>
                            @if($acara->jns_sertif==1)
                            <p class="text-muted">Layak Higiene Sanitasi Makanan</p>
                            @elseif($acara->jns_sertif==2)
                            <p class="text-muted">Pelatihan Tenaga Kesehatan</p>
                            @elseif($acara->jns_sertif==3)
                            <p class="text-muted">Piagam Penghargaan</p>
                            @elseif($acara->jns_sertif==4)
                            <p class="text-muted">Umum</p>
                            @else
                            <p class="text-muted">-</p>
                            @endif  

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
                                    <button class="btn btn-info btn-sm" data-toggle="modal"
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
                                        <th hidden>Link</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($peserta as $unit)
                                    <tr>
                                        <td>{{$unit->nama}}</td>
                                        <td>{{$unit->unitkerja}}</td>
                                        <td>{{$unit->jabatan}}</td>
                                        <td hidden>{{route('transaksi.cetak',['idacara'=>base64_encode($acara->idacara), 'idpeserta'=>base64_encode($unit->id)])}}</td>
                                        <td>
                                            <a href="{{route('transaksi.cetak',['idacara'=>base64_encode($acara->idacara), 'idpeserta'=>base64_encode($unit->id)])}}" class="btn btn-info btn-sm" target="_blank" rel="noreferrer noopener"><i class="fas fa-print nav-icon"></i></a>
                                            <button class="btn btn-danger btn-sm" onclick="hapus({{isset($unit->id) ? $unit->id : 0}})"><i class="fas fa-trash nav-icon"></i></button>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Nama</th>
                                        <th>Unit Kerja</th>
                                        <th>Jabatan</th>
                                        <th hidden>Link</th>
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

    @if($id!=0)
    function hapus(idpeserta){
        var $modal = $('#modalHapus');
        $('#formHapus').attr('action',"{{route('transaksi.hapus',['idtrans'=>$acara->id])}}"+'?idpeserta='+idpeserta);
        $modal.modal('show');
    }
    @endif

    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            buttons: [
                'copy', 'excel', 'print'
            ]
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