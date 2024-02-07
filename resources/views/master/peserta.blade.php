@extends('layouts.layout')

@section('title')
Data Peserta
@endsection

@section('masterShow')
menu-open
@endsection

@section('pesertaStatus')
active
@endsection

@section('content')
<!-- Modal Tambah Peserta -->
<div class="modal modal-danger fade" id="tambah" tabindex="-1" role="dialog" aria-labelledby="Tambah Peserta"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Tambah Peserta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('peserta.store')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-body row">
                    <div class="col-md-3">
                        <svg width="4cm" height="6cm" class="pasfoto mt-2">
                            <rect width="4cm" height="6cm" style="fill:#DDDDDD;" />
                            <text x="23%" y="55%" fill="grey" style="font-size:25px;">Pasfoto</text>
                            Sorry, your browser does not support inline SVG.  
                        </svg>
                        <div class="form-group mt-3">
                            <label for="background">Upload Pasfoto</label>
                            <div class="input-group">
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="pasfoto" name="pasfoto">
                                    <label class="custom-file-label" for="pasfoto">Pilih Foto</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label><b>NIK</b></label>
                                    <input type="text" id="nik" name="nik" class="form-control" placeholder="NIK" maxlength="16" required>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label><b>Nama</b></label>
                                    <input type="text" id="nama" name="nama" class="form-control" placeholder="Nama" required>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label><b>Tempat Lahir</b></label>
                                    <input type="text" id="tempatlahir" name="tempatlahir" class="form-control" placeholder="Tempat Lahir">
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label><b>Tanggal Lahir</b></label>
                                    <input type="date" id="tanggallahir" name="tanggallahir" class="form-control" placeholder="Tanggal Lahir">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><b>Alamat</b></label>
                                    <input type="text" id="alamat" name="alamat" class="form-control" placeholder="Alamat">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><b>Unit Kerja</b></label>
                                    <input type="text" id="unitkerja" name="unitkerja" class="form-control" placeholder="Unit Kerja" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><b>Jabatan</b></label>
                                    <input type="text" id="jabatan" name="jabatan" class="form-control" placeholder="Jabatan">
                                </div>
                            </div>
                        </div>    
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End Modal Tambah Peserta -->

<!-- Modal Tambah Peserta -->
<div class="modal modal-danger fade" id="import" tabindex="-1" role="dialog" aria-labelledby="Import Data Peserta"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Import Data Peserta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('peserta.import')}}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-body row">
                    <div class="col-md-12">
                        <div class="form-group mt-3">
                            <label for="background">Upload Excel</label>
                            <div class="input-group">
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="file" name="file">
                                    <label class="custom-file-label" for="file">Pilih File</label>
                                </div>
                            </div>
                        </div>
                    </div>
                        
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End Modal Tambah Peserta -->

<!-- Modal Edit Peserta -->
<div class="modal modal-danger fade" id="sunting" tabindex="-1" role="dialog" aria-labelledby="Edit Peserta"
    aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Edit Peserta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="" method="post" enctype="multipart/form-data" id="photo-form" style="display: none;">
                @csrf
                <input type="file" id="photo" name="pasfoto" hidden>
            </form>
            <form action="{{route('peserta.update', ['id'=>'0'])}}" method="POST">
                @csrf
                @method('PUT')
                <div class="modal-body row">
                    <div class="col-md-3 text-center">
                        <div id="no-foto">
                            <svg width="4cm" height="6cm" class="pasfoto mt-2">
                                <rect width="4cm" height="6cm" style="fill:#DDDDDD;" />
                                <text x="23%" y="55%" fill="grey" style="font-size:25px;">Pasfoto</text>
                                Sorry, your browser does not support inline SVG.  
                            </svg>
                        </div>
                        <div id="is-foto" hidden>
                            <img src="" class="pasfoto mt-2" id="pasfotoEdit" alt="Pasfoto">
                        </div>
                        <div class="mt-3 text-center">
                            <button class="btn btn-primary" type="button" id="trigger-photo">Upload Foto</button>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <input type="hidden" name="id" id="id">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label><b>NIK</b></label>
                                    <input type="text" id="nik" name="nik" class="form-control" placeholder="NIK" maxlength="16" required>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label><b>Nama</b></label>
                                    <input type="text" id="nama" name="nama" class="form-control" placeholder="Nama" required>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label><b>Tempat Lahir</b></label>
                                    <input type="text" id="tempatlahir" name="tempatlahir" class="form-control" placeholder="Tempat Lahir">
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label><b>Tanggal Lahir</b></label>
                                    <input type="date" id="tanggallahir" name="tanggallahir" class="form-control" placeholder="Tanggal Lahir">
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><b>Alamat</b></label>
                                    <input type="text" id="alamat" name="alamat" class="form-control" placeholder="Alamat">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><b>Unit Kerja</b></label>
                                    <input type="text" id="unitkerja" name="unitkerja" class="form-control" placeholder="Unit Kerja" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><b>Jabatan</b></label>
                                    <input type="text" id="jabatan" name="jabatan" class="form-control" placeholder="Jabatan">
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End Modal Edit Peserta -->

<!-- Modal Hapus Peserta -->
<div class="modal modal-danger fade" id="hapus" tabindex="-1" role="dialog" aria-labelledby="Hapus Peserta"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="tambahLabel">Hapus Peserta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{route('peserta.destroy', ['id'=>'0'])}}" method="POST" id="delete">
                @csrf
                @method('DELETE')
                <div class="modal-body">
                    <input type="hidden" name="id">
                    Anda Yakin Ingin Hapus Data?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- End Modal Hapus Peserta -->

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
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Data Master</a></li>
                        <li class="breadcrumb-item active">Peserta</li>
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
                            <h3 class="card-title">Data Peserta</h3>
                        </div>
                        <div class="col-md-6 text-right">
                            <button class="btn btn-info btn-sm" data-toggle="modal"
                                data-target="#import">Import</button>
                            <button class="btn btn-primary btn-sm" data-toggle="modal"
                                data-target="#tambah">Tambah</button>
                        </div>
                    </div>

                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <table id="table1" class="table table-bordered table-striped">
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
<script>

    var oTable;
    const isMobile = window.matchMedia("only screen and (max-width: 760px)").matches;

    function show(self){
        var tr = $(self).closest('tr');
        let idx = oTable.row(tr)[0]
        var data = oTable.data()[idx];
        
        sessionStorage.setItem('penilaian-filter', JSON.stringify(data));
        window.location.href = "{{url('/penilaian')}}";
    }

    function edit(self){
        var $modal=$('#sunting');
        var tr = $(self).closest('tr');
        let idx = oTable.row(tr)[0]
        var data = oTable.data()[idx];
        // console.log(data);
        
        $modal.find('input[name=id]').val(data['id']);
        $modal.find('input[name=nik]').val(data['nik']);
        $modal.find('input[name=nama]').val(data['nama']);
        $modal.find('input[name=tempatlahir]').val(data['tempatlahir']);
        $modal.find('input[name=tanggallahir]').val(data['tanggallahir']);
        $modal.find('input[name=alamat]').val(data['alamat']);
        $modal.find('input[name=unitkerja]').val(data['unitkerja']);
        $modal.find('input[name=jabatan]').val(data['jabatan']);
        
        if(data['pasfoto']) {
            $('#pasfotoEdit').attr('src',data['pasfoto']).change();
            $('#no-foto').attr('hidden', true);
            $('#is-foto').attr('hidden', false);
        } else {
            $('#no-foto').attr('hidden', false);
            $('#is-foto').attr('hidden', true);
        }

        $modal.modal('show');
    }

    function hapus(self){
        var tr = $(self).closest('tr');
        let idx = oTable.row(tr)[0]
        var data = oTable.data()[idx];

        $('#delete').find('input[name=id]').val(data['id']);
        var $modal = $('#hapus');
        $modal.modal('show');
    }

    $("#trigger-photo").click(function(){
        $("#photo").click();
    });

    document.getElementById("photo").onchange = async function() {
        file=$(this)[0].files[0];
        var idpeserta = $('#sunting').find('input[name=id]').val();
        
        try {
            var formData = new FormData();
            formData.append('_token', "{{ csrf_token() }}");
            formData.append('idpeserta', idpeserta);
            var newfile = await my.noMoreBigFile(file);
            formData.append('pasfoto', newfile);
            const res = await myRequest.upload( "{{route('peserta.upload')}}" , formData);
            window.location.reload();
        } catch (err) {
            // console.log('ayee'+err);
            alert('Terjadi kesalahan, pastikan file berupa gambar.');
        }
    };
    
    $(document).ready(function(){
        oTable = $("#table1").DataTable({
            
            processing: true,
            serverSide: true,
            ajax: {type: "POST", url: '{{route("peserta.data")}}', data:{'_token':@json(csrf_token())}},
            columns: [
                { data:'id', title:'ID', visible: false},
                { data:'nik', title:'NIK', name:'nik'},
                { data:'nama', title:'Nama'},
                { data:'tempatlahir', title:'Tempat, Tanggal Lahir', render: function(e,d,row){
                    return row['tempatlahir'] + ', ' + moment(row['tanggallahir']).format('DD MMMM YYYY');
                } },
                { data:'tanggallahir', title:'Tanggal Lahir', visible: false},
                { data:'alamat', title:'Alamat', visible: false},
                { data:'unitkerja', title:'Unit Kerja'},
                { data:'jabatan', title:'Jabatan'},
                { data:'action', title:'Aksi'},
            ],
        });
    });

    //filter tabel
    function filter(value, fieldDB, isRemove=false, delimitter="|"){
        let column = fieldDB+':name';
        let currentSearch = oTable.column(column).search();
        
        if(isRemove==true){
            currentSearch = currentSearch.split(delimitter);
            var index = currentSearch.indexOf(value);
            
            if (index !== -1) {
                currentSearch.splice(index, 1);
            }
            input = ''
            currentSearch.forEach(unit => {
                if(input==''){
                    input = unit;
                }
                else{
                    input += ('|'+unit);
                }
            });
            if(currentSearch==[]) input='';
            currentSearch = input;
        }
        else{
            if(currentSearch==''){
                currentSearch = value;
            }
            else{
                currentSearch += ('|'+value);
            }
        }
        
        oTable.column(column).search( currentSearch , true, false);
        oTable.draw();
    }

    document.getElementById('filter').addEventListener( 'addItem', function(e) {
            let id = 'id'+e.detail.groupValue.toLowerCase();
            filter(e.detail.value, id )
        },
        false,
    );

    document.getElementById('filter').addEventListener( 'removeItem', function(e) {
            let id = 'id'+e.detail.groupValue.toLowerCase();
            filter(e.detail.value, id, true )
        },
        false,
    );

    $(function() {
        bsCustomFileInput.init();
    });
</script>
@endsection