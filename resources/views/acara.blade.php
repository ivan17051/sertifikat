@extends('layouts.layout')

@section('acaraStatus')
active
@endsection

@section('content')
<div class="modal fade" id="modalAbsenMasuk">
    <div class="modal-dialog @if(isset($absen->geotag_msk)) modal-lg @endif">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h4 class="modal-title">Absensi Masuk</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('absensi.store')}}" method="post" id="formAbsenMasuk" enctype="multipart/form-data">
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
                                        <input type="file" class="custom-file-input" id="geotag_msk" name="geotag_msk" required>
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
            <form action="{{route('absensi.update', ['id'=>''])}}/{{isset($absen->id) ? $absen->id : 0}}" method="post"
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
                                        <input type="file" class="custom-file-input" id="geotag_plg" name="geotag_plg" required>
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
<div class="modal fade" id="modalIzin">
    <div class="modal-dialog @if(isset($absen->bukti_izin)) modal-lg @endif">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h4 class="modal-title">Izin</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{ route('absensi.store') }}" method="post" id="formIzin" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">

                    <!-- <input type="hidden" name="id" id="inputid"> -->
                    <div class="row">
                        <div class="@if(isset($absen->bukti_izin)) col-md-5 @else col-md-12 @endif">
                            <div class="form-group">
                                <label for="tanggal">Tanggal</label>
                                <input type="date" class="form-control" name="tanggal" style="font-size: 20px;"
                                    value="{{date('Y-m-d')}}" disabled>
                            </div>
                            <div class="form-group">
                                <label for="keterangan">Keterangan Izin</label>
                                <input type="text" class="form-control" name="keterangan" style="font-size: 20px;"
                                    value="{{isset($absen->keterangan) ? $absen->keterangan : ''}}" @if(isset($absen) &&
                                    $absen->status > 3)) disabled @endif required>
                            </div>
                            @if(!isset($absen->keterangan))
                            <div class="form-group">
                                <label for="buktiIzin">Upload Foto Surat Izin / Surat Dokter</label>
                                <div class="input-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="bukti_izin" name="bukti_izin">
                                        <label class="custom-file-label" for="bukti_izin">Pilih Foto</label>
                                    </div>
                                </div>
                            </div>
                            @endif

                        </div>
                        @if(isset($absen->bukti_izin))
                        <div class="col-md-7">
                            <img src="{{$absen->bukti_izin}}" alt="Foto" class="img-fluid rounded-start">
                        </div>
                        @endif
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    @if(!isset($absen))
                    <button type="submit" class="btn btn-primary">Simpan</button>
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
                        <li class="breadcrumb-item active">Tampilan Awal</li>
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
            <h3 style="text-align:center;">Selamat Datang</h3>
            <h2 style="text-align:center;">{{Auth::user()->nama}}</h2>
            <!-- <h5 style="text-align:center;padding-bottom: 20px;">Puskesmas Asemrowo</h5> -->
            <div class="row pb-4">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                </div>
                <div class="col-md-3"></div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <!-- small box -->

                    <a class="small-box bg-info btn" onclick="submit(1)">
                        <div class="inner">
                            <h4 style="margin-bottom:0;">Absen Masuk</h4>

                            <!-- <p>New Orders</p> -->
                        </div>
                        <div class="icon">
                            @if(isset($absen->keterangan))
                            <i class="far {{isset($absen->status) && $absen->status > 3 ? 'fa-minus-square' : 'fa-square'}}"
                                style="position: inherit;padding-bottom: 20px;"></i>
                            @else
                            <i class="far {{isset($absen->status) && $absen->status > 0 ? 'fa-check-square' : 'fa-square'}}"
                                style="position: inherit;padding-bottom: 20px;"></i>
                            @endif
                        </div>
                    </a>
                </div>
                <!-- ./col -->
                <div class="col-md-4">
                    <!-- small box -->
                    <a class="small-box bg-success btn" onclick="submit(2)">
                        <div class="inner">
                            <h4 style="margin-bottom:0;">Absen Pulang</h4>

                            <!-- <p>New Orders</p> -->
                        </div>
                        <div class="icon">
                            @if(isset($absen->keterangan))
                            <i class="far {{isset($absen->status) && $absen->status > 3 ? 'fa-minus-square' : 'fa-square'}}"
                                style="position: inherit;padding-bottom: 20px;"></i>
                            @else
                            <i class="far {{isset($absen->status) && $absen->status > 1 ? 'fa-check-square' : 'fa-square'}}"
                                style="position: inherit;padding-bottom: 20px;"></i>
                            @endif
                        </div>
                    </a>
                </div>
                <!-- ./col -->
                <div class="col-md-4">
                    <!-- small box -->
                    <a class="small-box bg-primary btn" onclick="submit(3)">
                        <div class="inner">
                            <h4 style="margin-bottom:0;">Izin</h4>

                            <!-- <p>New Orders</p> -->
                        </div>
                        <div class="icon">
                            <i class="far {{isset($absen->status) && $absen->status > 0 ? 'fa-minus-square' : 'fa-square'}}"
                                style="position: inherit;padding-bottom: 20px;"></i>
                        </div>
                    </a>
                </div>
                <!-- ./col -->
                <div class="col-md-6">
                    <!-- small box -->
                    <a href="{{route('absensi.show',['absensi'=>Auth::user()->id])}}" class="small-box bg-warning btn">
                        <div class="inner">
                            <h4 style="margin-bottom:0;">Cek Absensi</h4>

                            <!-- <p>New Orders</p> -->
                        </div>
                        <div class="icon">
                            <i class="fas fa-tasks" style="position: inherit;padding-bottom: 20px;"></i>
                        </div>
                    </a>
                </div>
                <!-- ./col -->
                <div class="col-md-6">
                    <!-- small box -->
                    <a href="{{route('agenda.index')}}" class="small-box bg-secondary btn">
                        <div class="inner">
                            <h4 style="margin-bottom:0;">Agenda</h4>

                            <!-- <p>New Orders</p> -->
                        </div>
                        <div class="icon">
                            <i class="fas fa-calendar-check" style="position: inherit;padding-bottom: 20px;"></i>
                        </div>
                    </a>
                </div>

            </div>
            <!-- /.row -->

        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->

</div>
<!-- /.content-wrapper -->

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

    $('#formAbsenMasuk').one('submit', function() {
        $(this).find('button[type="submit"]').attr('disabled', true);
    });
    $('#formIzin').one('submit', function() {
        $(this).find('button[type="submit"]').attr('disabled', true);
    });

</script>
@endsection