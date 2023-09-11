@extends('layouts.layout')

@section('verifStatus')
active
@endsection

@section('content')
<div class="modal fade" id="modalVerif">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h4 class="modal-title">Verifikasi</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('absensi.verif', ['id'=>''])}}" method="post">
                @csrf
                @method('PUT')
                <!-- <button class="btn btn-success btn-sm"><i class="nav-icon fas fa-user-check"></i> Verifikasi</button> -->

                <div class="modal-body">

                    <input type="hidden" name="id" id="id">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tanggal">Tanggal</label>
                                <input type="date" class="form-control" name="tanggal" style="font-size: 20px;"
                                    value="{{date('Y-m-d')}}" disabled>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="tanggal">Waktu Masuk</label>
                                <input type="time" class="form-control" name="jam_msk" style="font-size: 20px;"
                                    step="1">
                            </div>
                            <div class="form-group">
                                <label for="doc">Waktu Upload Absen Masuk</label>
                                <input type="text" class="form-control" name="doc" style="font-size: 20px;" disabled>
                            </div>
                            <div class="form-group">
                                <label for="geotag_msk">Foto Geotag Masuk</label>
                                <img src="" alt="Foto" class="img-fluid rounded-start" name="geotag_msk">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="tanggal">Waktu Pulang</label>
                                <input type="time" class="form-control" name="jam_plg" style="font-size: 20px;"
                                    step="1">
                            </div>
                            <div class="form-group">
                                <label for="tanggal">Waktu Upload Absen Pulang</label>
                                <input type="text" class="form-control" name="dom" style="font-size: 20px;" disabled>
                            </div>
                            <div class="form-group">
                                <label for="geotag_plg">Foto Geotag Pulang</label>
                                <img src="" alt="Foto" class="img-fluid rounded-start" name="geotag_plg">
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
<div class="modal fade" id="modalVerifIzin">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-info">
                <h4 class="modal-title">Verifikasi</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('absensi.verif', ['id'=>''])}}" method="post">
                @csrf
                @method('PUT')
                <!-- <button class="btn btn-success btn-sm"><i class="nav-icon fas fa-user-check"></i> Verifikasi</button> -->

                <div class="modal-body">

                    <input type="hidden" name="id" id="id">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tanggal">Tanggal</label>
                                <input type="date" class="form-control" name="tanggal" style="font-size: 20px;"
                                    value="{{date('Y-m-d')}}" disabled>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="keterangan">Keterangan</label>
                                <input type="text" class="form-control" name="keterangan" style="font-size: 20px;"
                                    disabled>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="bukti_izin">Foto Pendukung Izin</label>
                                <img src="" alt="Foto" class="img-fluid rounded-start" name="bukti_izin">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-info">Validasi</button>

                </div>
            </form>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="modal fade" id="modalAbsenAdmin">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary">
                <h4 class="modal-title">Absensi</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{ route('absensi.store') }}" method="post" id="formAbsenAdmin" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tanggal">Nama</label>
                                <select name="iduser" class="form-control select2" required>
                                    <option value="">--Pilih--</option>
                                    @foreach($user as $unit)
                                    <option value="{{$unit->id}}">{{$unit->nama}}</option>
                                    @endforeach

                                </select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tanggal">Tanggal</label>
                                <input type="date" class="form-control" name="tanggal" value="{{date('Y-m-d')}}" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="jam_msk">Jam Masuk</label>
                                <input type="time" class="form-control" name="jam_msk" step="1" required>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="tanggal">Jam Pulang</label>
                                <input type="time" class="form-control" name="jam_plg" step="1">
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
                        <li class="breadcrumb-item active">Verifikasi</li>
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
                    <div class="row">
                        <div class="col-md-6">
                            <h3 class="card-title">Validasi Data</h3>
                        </div>
                        <div class="col-md-6 text-right">
                            <button class="btn btn-primary btn-sm" data-toggle="modal"
                                data-target="#modalAbsenAdmin">Tambah</button>
                        </div>
                    </div>

                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row mb-4">
                        <div class="col-md-5">
                            <label for="tanggal">Tanggal</label>
                            <input type="date" class="form-control" name="tanggal" onchange="gantitanggal(this)"
                                value="{{isset($tanggal) ? $tanggal : date('Y-m-d')}}">
                        </div>

                    </div>


                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Unit Kerja</th>
                                <th>Nama</th>
                                <th>Tanggal</th>
                                <th>Jam Masuk</th>
                                <th>Jam Pulang</th>
                                <th>Status</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($absen as $key=>$unit)
                            <tr>
                                <td>{{isset($unit->idunitkerja) ? $unit->unitKerja->nama : ''}}</td>
                                <td>{{$unit->user->nama}}</td>
                                <td>{{Carbon\Carbon::make($unit->tanggal)->isoFormat('dddd, D MMMM Y')}}</td>
                                <td>{{isset($unit->jam_msk) ? $unit->jam_msk : '-'}}</td>
                                <td>{{isset($unit->jam_plg) ? $unit->jam_plg : '-'}}</td>
                                <td>
                                    @if($unit->status==1)
                                    <span class="badge badge-warning">Sudah Absen Masuk</span>
                                    @elseif($unit->status==2)
                                    <span class="badge badge-info">Sudah Absen Pulang</span>
                                    @elseif($unit->status==3)
                                    <span class="badge badge-success">Terverifikasi</span>
                                    @elseif($unit->status==4)
                                    <span class="badge badge-danger">Izin</span>
                                    @elseif($unit->status==5)
                                    <span class="badge badge-success">Izin Terverifikasi</span>
                                    @endif
                                </td>
                                <td>
                                    @if($unit->status==2 || $unit->status==4)
                                    <button class="btn btn-info btn-sm" onclick="verif(this, {{$unit->status}})"
                                        key="{{$key}}"><i class="nav-icon fas fa-eye"></i> Lihat</button>

                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Unit Kerja</th>
                                <th>Nama</th>
                                <th>Tanggal</th>
                                <th>Jam Masuk</th>
                                <th>Jam Pulang</th>
                                <th>Status</th>
                                <th>Aksi</th>
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
    var myUsers = @json($absen);

    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');

        $('.select2').select2({
            theme: 'bootstrap4'
        });
    });

    function verif(self, status) {

        var key = $(self).attr('key');
        var j = myUsers[key];

        if (status == 2) {
            $modal = $('#modalVerif');

            $modal.find('[name=id]').val(j['id']).change();
            $modal.find('[name=tanggal]').val(j['tanggal']).change();
            $modal.find('[name=jam_msk]').val(j['jam_msk']).change();
            $modal.find('[name=jam_plg]').val(j['jam_plg']).change();
            $modal.find('[name=doc]').val(j['doc']).change();
            $modal.find('[name=dom]').val(j['dom']).change();
            $modal.find('[name=geotag_msk]').attr('src', j['geotag_msk']).change();
            $modal.find('[name=geotag_plg]').attr('src', j['geotag_plg']).change();
        } else if (status == 4) {
            $modal = $('#modalVerifIzin');

            $modal.find('[name=id]').val(j['id']).change();
            $modal.find('[name=tanggal]').val(j['tanggal']).change();
            $modal.find('[name=keterangan]').val(j['keterangan']).change();
            $modal.find('[name=bukti_izin]').attr('src', j['bukti_izin']).change();

        }

        $modal.find('form').attr('action', "{{route('absensi.verif', ['id'=>''])}}/" + j['id']);
        $modal.modal('show');
    }

    function gantitanggal(self) {
        window.location.href = "{{route('verif.show',['tanggal'=>''])}}" + self.value;
    }

</script>
@endsection