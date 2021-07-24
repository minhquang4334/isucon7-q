module Transaction
  def transaction(name)
    begin_transaction(name)
    yield(name)
    commit_transaction(name)
  rescue Exception => e
    puts "Failed to commit tx: #{e.inspect}"
    rollback_transaction(name)
    raise
  ensure
    ensure_to_abort_transaction(name)
  end

  def begin_transaction(name)
    Thread.current[:db_transaction] ||= {}
    db.query('BEGIN')
    Thread.current[:db_transaction][name] = :open
  end

  def commit_transaction(name)
    Thread.current[:db_transaction] ||= {}
    db.query('COMMIT')
    Thread.current[:db_transaction][name] = :nil
  end

  def rollback_transaction(name)
    Thread.current[:db_transaction] ||= {}
    db.query('ROLLBACK')
    Thread.current[:db_transaction][name] = :nil
  end

  def ensure_to_abort_transaction(name)
    Thread.current[:db_transaction] ||= {}
    if in_transaction?(name)
      puts "Transaction closed implicitly (#{$$}, #{Thread.current.object_id}): #{name}"
      rollback_transaction(name)
    end
  end

  def in_transaction?(name)
    Thread.current[:db_transaction] && Thread.current[:db_transaction][name] == :open
  end
end
